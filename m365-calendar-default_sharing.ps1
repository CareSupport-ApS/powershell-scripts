Import-module ExchangeOnlineManagement
Connect-ExchangeOnline

foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {

$UPN = $user.UserPrincipalName
$CalFolder = Get-MailboxFolderStatistics $UPN -FolderScope Calendar | select-object -First 1
$Kalender = $UPN + ":\" + $calfolder.Name
Write-Output $Kalender
#Set-MailboxFolderPermission -Identity $cal -User Default -AccessRights LimitedDetails

}