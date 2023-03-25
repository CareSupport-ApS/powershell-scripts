Import-module ExchangeOnlineManagement

$AdminUser = Read-Host -Prompt 'Enter azure admin e-mail'

Connect-ExchangeOnline -UserPrincipalName $AdminUser


$ArchiveUser = Read-Host -Prompt 'Enter e-mail of the user you want to archive'
Set-Mailbox -Identity $ArchiveUser -Type Shared


Set-Mailbox -Identity $ArchiveUser -HiddenFromAddressListsEnabled $true

$User =  Get-Mailbox -Identity $ArchiveUser

Set-User -Identity $ArchiveUser -DisplayName "Arkiv - " + $User.DisplayName