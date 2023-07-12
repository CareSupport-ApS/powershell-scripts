Import-module ExchangeOnlineManagement

$AdminUser = Read-Host -Prompt 'Enter azure admin e-mail'

Connect-ExchangeOnline -UserPrincipalName $AdminUser

 do {
        $AutoReplyFile = Read-Host -Prompt 'Enter the path to the auto-reply file'
        if (-not (Test-Path -Path $AutoReplyFile -PathType Leaf)) {
            Write-Host "Auto-reply file not found. Please enter a valid file path."
        }
    } while (-not (Test-Path -Path $AutoReplyFile -PathType Leaf))

$AutoReplyTemplate = Get-Content -Path $AutoReplyFile -Raw

do {
$ArchiveUser = Read-Host -Prompt 'Enter e-mail of the user you want to archive'
$User = Get-Mailbox -Identity $ArchiveUser

Write-Host "Will archive" $User.DisplayName
Set-Mailbox -Identity $ArchiveUser -Type Shared

Set-Mailbox -Identity $ArchiveUser -HiddenFromAddressListsEnabled $true

$AutoReplyMessage = $AutoReplyTemplate -replace '\{NAME\}', $User.DisplayName

$DisplayName = "[ARCHIVE] - " + $User.DisplayName.ToString()
Set-User -Identity $ArchiveUser -DisplayName $DisplayName
Set-MailboxAutoReplyConfiguration -Identity $ArchiveUser -ExternalAudience All -AutoReplyState Enabled -ExternalMessage $AutoReplyMessage -InternalMessage $AutoReplyMessage
$Continue = Read-Host -Prompt 'Do you want to archive another user? (Y/N)'
} while ($Continue -eq 'Y')