Import-module ExchangeOnlineManagement
Connect-ExchangeOnline

# Definer hvilken slags permission der skal sættes
$DefaultCalendarPermissionToSet = "Reviewer"

# Loop gennem alle bruger opjekter
foreach($user in Get-Mailbox -RecipientTypeDetails UserMailbox) {

$UPN = $user.UserPrincipalName
$CalFolder = Get-MailboxFolderStatistics $UPN -FolderScope Calendar | select-object -First 1
$Kalender = $UPN + ":\" + $calfolder.Name
Write-Output "Setting permissions for " $UPN
Set-MailboxFolderPermission -Identity $Kalender -User Default -AccessRights $DefaultCalendarPermissionToSet -WarningAction:SilentlyContinue
Set-MailboxRegionalConfiguration -Identity $UPN -Language da-dk -DateFormat "dd-MM-yyyy" -LocalizeDefaultFolderName
}