Import-module ExchangeOnlineManagement

$AdminUser = Read-Host -Prompt 'Enter azure admin e-mail'

Connect-ExchangeOnline -UserPrincipalName $AdminUser

do {
    $GitHubRawLink = Read-Host -Prompt 'Enter the GitHub raw link to the auto-reply file'
    
    try {
        $AutoReplyTemplate = Invoke-WebRequest -Uri $GitHubRawLink | Select-Object -ExpandProperty Content
    }
    catch {
        Write-Host "Failed to fetch the auto-reply file from the GitHub raw link. Please enter a valid link."
    }
} while ([string]::IsNullOrEmpty($AutoReplyTemplate))

do {
$ArchiveUser = Read-Host -Prompt 'Enter e-mail of the user you want to archive'
$PrivateContact = Read-Host -Prompt 'Enter the private contact information of the user, if none just press enter'
$User = Get-Mailbox -Identity $ArchiveUser

Write-Host "Will archive" $User.DisplayName

$AutoReplyMessage = $AutoReplyTemplate -replace '\{NAME\}', $User.DisplayName
if ($PrivateContact -ne "") {
    $AutoReplyMessage = $AutoReplyTemplate -replace '\{PRIVATECONTACT_DK}', ($User.DisplayName + " kan kontaktes på: " + $PrivateContact)
}
else {
    $AutoReplyMessage = $AutoReplyTemplate -replace '\{PRIVATECONTACT_DK}', ""
}

Write-Host $AutoReplyMessage

Set-Mailbox -Identity $ArchiveUser -Type Shared

Set-Mailbox -Identity $ArchiveUser -HiddenFromAddressListsEnabled $true


#$DisplayName = "[ARCHIVE] - " + $User.DisplayName.ToString()
#Set-User -Identity $ArchiveUser -DisplayName $DisplayName
#Set-MailboxAutoReplyConfiguration -Identity $ArchiveUser -ExternalAudience All -AutoReplyState Enabled -ExternalMessage $AutoReplyMessage -InternalMessage $AutoReplyMessage
$Continue = Read-Host -Prompt 'Do you want to archive another user? (Y/N)'
} while ($Continue -eq 'Y')