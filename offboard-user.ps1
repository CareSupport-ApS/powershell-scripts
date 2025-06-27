Import-Module PartnerCenter
Import-Module ExchangeOnlineManagement
Import-Module Microsoft.Graph.Users
Import-Module Microsoft.Graph.Groups
Import-Module Microsoft.Graph.Authentication

# 1. Authenticate as Partner
Connect-PartnerCenter

# 2. Select customer by domain
$CustomerDomain = Read-Host -Prompt 'Enter the domain of the customer'
$Customer = Get-PartnerCustomer | Where-Object { $_.Domain -eq $CustomerDomain }

if (-not $Customer) {
    Write-Error "Customer '$CustomerDomain' not found."
    return
}

# 3. Get Graph token for customer's tenant
$Token = New-PartnerAccessToken -CustomerTenantId $Customer.CustomerId -Resource "https://graph.microsoft.com" -Scopes "https://graph.microsoft.com/.default"


# 4. Connect Graph with access token (app-only)
Connect-MgGraph -AccessToken $Token.AccessToken

# 5. Connect to Exchange Online using delegated admin access
$PartnerAdminUser = Read-Host -Prompt 'Enter your partner admin e-mail'
Connect-ExchangeOnline -UserPrincipalName $PartnerAdminUser -DelegatedOrganization $CustomerDomain

# 6. Get auto-reply message template
$GitHubRawLink = $null

while ([string]::IsNullOrEmpty($GitHubRawLink)) {
    $GitHubRawLink = Read-Host -Prompt 'Enter the GitHub raw link to the auto-reply file'
    try {
        $AutoReplyTemplate = Invoke-WebRequest -Uri $GitHubRawLink -UseBasicParsing | Select-Object -ExpandProperty Content
    } catch {
        Write-Host "Failed to fetch the template. Try again."
        $GitHubRawLink = $null
    }
}

# 7. Archive loop

Do {
    $ArchiveUser = Read-Host -Prompt 'Enter e-mail of the user you want to archive'
    $PrivateContact = Read-Host -Prompt 'Enter the private contact info (optional)'

    $User = Get-Mailbox -Identity $ArchiveUser
    Write-Host "Will archive" $User.DisplayName

    $AutoReplyMessage = $AutoReplyTemplate -replace '\{NAME\}', $User.DisplayName

    if ($PrivateContact -ne "") {
        $AutoReplyMessage = $AutoReplyMessage -replace '\{PRIVATECONTACT_DK\}', ($User.DisplayName + " kan kontaktes på: " + $PrivateContact)
        $AutoReplyMessage = $AutoReplyMessage -replace '\{PRIVATECONTACT_EN\}', ($User.DisplayName + " can be contacted on: " + $PrivateContact)
    } else {
        $AutoReplyMessage = $AutoReplyMessage -replace '\{PRIVATECONTACT_DK\}', ""
        $AutoReplyMessage = $AutoReplyMessage -replace '\{PRIVATECONTACT_EN\}', ""
    }

    # Archive in Exchange
    Set-Mailbox -Identity $ArchiveUser -Type Shared
    Set-MailboxAutoReplyConfiguration -Identity $ArchiveUser -ExternalAudience All -AutoReplyState Enabled -ExternalMessage $AutoReplyMessage -InternalMessage $AutoReplyMessage
    Set-Mailbox -Identity $ArchiveUser -HiddenFromAddressListsEnabled $true

    $DisplayName = "[ARCHIVE] - " + $User.DisplayName
    Set-User -Identity $ArchiveUser -DisplayName $DisplayName

    # Remove user from all groups and disable in Azure AD
    try {
        $MgUser = Get-MgUser -UserId $ArchiveUser
        $Groups = Get-MgUserMemberOf -UserId $ArchiveUser | Where-Object { $_.'@odata.type' -eq '#microsoft.graph.group' }

        foreach ($Group in $Groups) {
            try {
                Remove-MgGroupMember -GroupId $Group.Id -DirectoryObjectId $MgUser.Id -ErrorAction Stop
                Write-Host "Removed from group: $($Group.AdditionalProperties['displayName'])"
            } catch {
                Write-Host "Failed to remove from group: $($_.Exception.Message)"
            }
        }

        Update-MgUser -UserId $ArchiveUser -AccountEnabled:$false
        Write-Host "User $ArchiveUser has been disabled."

    } catch {
        Write-Host "Failed to disable or remove user from groups: $($_.Exception.Message)"
    }

    $Continue = Read-Host -Prompt 'Do you want to archive another user? (Y/N)'

} while ($Continue -eq 'Y')
