$title = "Create a User Account in Active Directory"

$host.ui.RawUI.WindowTitle = $title

Import-Module ActiveDirectory -EA Stop

sleep 5
cls


write-host ======================Skapa konto på SF========================= -ForegroundColor Cyan
Write-Host "Kontrollera så att kontot redan inte finns innan du fortsätter" -ForegroundColor yellow


Write-Host
Write-Host

$firstname = Read-Host "
                       `nAnge förnamnet här"

$middlename = Read-Host "
                       `nAnge mellannamn här om personen har det, tryck annars ENTER"

$lastname = Read-Host "
                       `nAnge efternamnet här"

if ($middlename -gt '*'){
    $fullname = "$firstname $middlename $lastname"

    }
    else {
    $fullname = "$firstname $lastname"
    }


$logonname = $firstname.Replace(' ','') + '.' + $lastname.Replace(' ','')

Do{


    $OU = Read-Host "Vad har användaren för anställningsform 
                        `n

                        `n1) Anställd
                        `n2) Konsult
                        `n3) Temporär
                        `n * Välj siffra för kontotyp"
}While($OU -notin 1,2,3)

    switch ($OU)
    {
        '1' { "Anställd"


            if($OU -eq '1') {


            $OU = "OU=Users,OU=SF,DC=ads,DC=bonniergroup,DC=com"
            $employmenttype = "Permanent"
                }
            }


        '2' { "Konsult"


            if($OU -eq '2') {


                $OU = "OU=Users,OU=consultants,OU=Common,OU=SF,DC=ads,DC=bonniergroup,DC=com"
                $employmenttype = "Consultant"


                }
            }
        '3' { "Temporär"


            if($OU -eq '3') {


                $OU = "OU=Users,OU=consultants,OU=Common,OU=SF,DC=ads,DC=bonniergroup,DC=com"
                $employmenttype = "Temporary"


                }
            }

       }







$logonname = $logonname -replace 'å','a'
$logonname = $logonname -replace 'ä','a'
$logonname = $logonname -replace 'ö','o'
$logonname = $logonname -replace 'Ø','o'
$logonname = $logonname -replace 'æ','a'

clear-host



write-host
write-host
Do{
    $Domain = Read-Host "Välj Domän 
                        `n

                        `n1) sfanytime.com
                        `n2) sfstudios.se
                        `n3) sfstudios.dk
                        `n4) sfstudios.no
                        `n5) sfstudios.fi
                        `n * Välj siffran för vilken domän du ska ha?" 

}While($Domain -notin 1,2,3,4,5)

    switch ($Domain)
    {
        '1' { "sfanytime.com"


            if($domain -eq '1') {


                $Domain = "sfanytime.com"
                }
            }


        '2' { "sfstudios.se"


            if($Domain -eq '2') {


                $Domain = "sfstudios.se"


                }
            }
        '3' { "sfstudios.dk"


            if($Domain -eq '3') {


                $Domain = "sfstudios.dk"


                }
            }
        '4' { "sfstudios.no"


            if($Domain -eq '4') {


                $Domain = "sfstudios.no"


                }
            }
        '5' { "sfstudios.fi"


            if($Domain -eq '5') {


                $Domain = "sfstudios.fi"


                }
            }

    }



clear-host 

Do{
    $Country = Read-Host "Välj Land
                        `n

                        `n1) Sverige
                        `n2) Norge
                        `n3) Danmark
                        `n4) Finland
                        `n * Välj siffran för vilket land användaren befinner sig i" 

}While($Country -notin 1,2,3,4)

    switch ($Country)
    {
        '1' { "Sverige"


            if($Country -eq '1') {


                $c = "SE"
                $co = "Sweden"
                $countrycode = 752
                $streetaddress = "Solnavägen 3h"
                $postalcode = "113 63"
                $city = "Stockholm"
                }
            }


        '2' { "Norge"


            if($Country -eq '2') {


                $c = "NO"
                $co = "Norge"
                $countrycode = 578
                $streetaddress = "Dronningens gt. 8a"
                $postalcode = "152"
                $city = "Oslo"


                }
            }
        '3' { "Danmark"


            if($Country -eq '3') {


                $c = "DK"
                $co = "Denmark"
                $countrycode = 208
                $streetaddress = "Wildersgade 8"
                $postalcode = "1408"
                $city = "København K"


                }
            }
        '4' { "Finland"


            if($Country -eq '4') {


                $c = "FI"
                $co = "Finland"
                $countrycode = 246
                $streetaddress = "Runeberginkatu 5"
                $postalcode = "100"
                $city = "Helsinki"


                }
            }

    }



clear-host


Do{


    $Company = Read-Host "============ Välj Company ============
                        `n
                        `n === Sverige ===
                        `n1) AB Svensk Filmindustri
                        `n2) SF Studios Production AB
                        `n3) SF Anytime AB
                        `n
                        `n === Danmark ===
                        `n4) SF Studios Production ApS
                        `n5) SF Film A/S
                        `n
                        `n === Norge ===

                        `n6) SF Norge AS
                        `n
                        `n === Finland ===
                        `n7) SF Film Finland OY
                        `n Välj Company genom att trycka på sifran och sen tryck Enter"

   }While($Company -notin 1,2,3,4,5,6,7)

    switch ($Company)
    {
        '1' { "AB Svensk Filmindustri"


            if($Company -eq '1') {


                $company = "AB Svensk Filmindustri"
                }
            }


        '2' { "SF Studios Production AB"


            if($Company -eq '2') {


                $company = "SF Studios Production AB"


                }
            }
        '3' { "SF Anytime AB"


            if($Company -eq '3') {


                $company = "SF Anytime AB"


                }
            }
        '4' { "SF Studios Production ApS"


            if($Company -eq '4') {


                $company = "SF Studios Production ApS"


                }
            }
        '5' { "SF Film A/S"


            if($Company -eq '5') {


                $company = "SF Film A/S"


                }
            }
        '6' { "SF Norge AS"


            if($Company -eq '6') {


                $company = "SF Norge AS"


                }
            }


        '7' { "SF Film Finland OY"


            if($Company -eq '7') {


                $company = 'SF Film Finland OY'


                }
            }
    }



clear-host 

sleep 2




$Title = Read-Host "Vad har användaren för Title(Arbetsroll) 
                   `n
                   `n Skriv användarens title här"



clear-host

write-host
write-host "OBS Det ska vara User logon name(Pre Windows 2000)" -ForegroundColor Yellow

do {

$Manager = Read-host "Vem är användarens Chef?
                      `n
                      `n Skriv chefens användarnamn här"

$CheckUser = Get-ADUser -filter {SamAccountName -eq $manager}

if($CheckUser) {



$Exit = "True"



} else {

Write-Host "Användare $($manager) finns inte, försök igen!" -ForegroundColor Yellow

$Exit = "False"

}

} until ($Exit -eq "True")

cls

$Department = read-host "Vilken avdelning ska användaren jobba? 
                   `n
                   `n Skriv användarens avdelning här"

clear-host

Do{
    $Directreports = Read-Host "Har användaren Direct Reports?
                        `n

                        `n1) Ja
                        `n2) Nej
                        `n * Välj Ja om personen har Direct Reports, annars nej" 

}While($Directreports -notin 1,2)

    switch ($Directreports) {


        '1' { "Ja"


            if($Directreports -eq '1' -and $co -eq "Sweden") {


                $extensionAttribute8 = "ManagerSwe"
                $ismanager = "Yes"
                }
            elseif($Directreports -eq '1' -and $co -ne "Sweden") {


                $extensionAttribute8 = "Manager"
                $ismanager = "Yes"
                }
            }
        '2' { "Nej"

            if($Directreports -eq '2') {
                $ismanager = "No"


    }


    }

}

clear-host

if ($employmenttype -ne "Permanent")
{
Do{
    $Mailgroups = Read-Host "Ska användaren exkluderas från mailgrupper?
                        `n

                        `n1) Ja
                        `n2) Nej
                        `n * Välj Ja om inget annat är beställt (Standard för konsulter/temporära)" 

}While($Mailgroups -notin 1,2)

    switch ($Mailgroups) {


        '1' { "Ja"


            if($Mailgroups -eq '1') {


                $extensionAttribute8 = "NoMailGroups"
                $ismanager = "No"
                }
            elseif($Mailgroups -eq '') {


                $extensionAttribute8 = "NoMailGroups"
                $ismanager = "No"
                }
            }
        '2' { "Nej"

            if($Mailgroups -eq '2') {
                $ismanager = "No"


    }


    }

}
}

cls

#Displaying Account information.
Write-Host "======================================="
Write-Host
Write-Host "Firstname:       $firstname"
Write-Host "Middlename:      $middlename"
Write-Host "Lastname:        $lastname"
Write-Host "Display name:    $fullname"
Write-Host "Logon name:      $logonname"
Write-Host "OU:              $OU"
Write-Host "Domain:          $domain"
Write-Host "Country:         $co"
Write-Host "E-mail:          $logonname + '@' + $domain"
Write-Host "Company:         $company"
Write-Host "Manager:         $manager"
Write-Host "Title:           $title"
Write-Host "Direct Reports:  $ismanager"
Write-Host "Employment Type: $employmenttype"




#Checking to see if user account already exists.  If it does it
#will append the next letter of the first name to the username.
DO
{
If ($(Get-ADUser -Filter {SamAccountName -eq $logonname})) {
        Write-Host "WARNING: Logon name" $logonname.toUpper() "already exists!!" -ForegroundColor:Green
        $logonname = $firstname + '.' + $lastname
        Write-Host
        Write-Host
        Write-Host "Changing Logon name to" $logonname.toUpper() -ForegroundColor:Green
        Write-Host
        $taken = $true
        sleep 10
    } else {
    $taken = $false
    }
} Until ($taken -eq $false)
$logonname = $logonname.toLower()

cls
#Displaying account information that is going to be used.
Write-Host "======================================="
Write-Host "Kontot kommer att skapas med uppgifterna nedan. Om nånting har blivit fel stäng bara av programmet och börja om från början" 
Write-Host
Write-Host "Firstname:       $firstname"
Write-Host "Middlename:      $middlename"
Write-Host "Lastname:        $lastname"
Write-Host "Display name:    $fullname"
Write-Host "Logon name:      $logonname"
Write-Host "OU:              $OU"
Write-Host "Domain:          $domain"
Write-Host "Country:         $co"
Write-Host "E-mail:          $logonname + '@' + $domain"
Write-Host "Company:         $company"
Write-Host "Department:      $Department"
Write-Host "Manager:         $manager"
Write-Host "Title:           $title"
Write-Host "Direct Reports:  $ismanager"
Write-Host "Employment Type: $employmenttype"


#Setting minimum password length to 12 characters and adding password complexity.
$PasswordLength = 8

write-host
Write-host "Password policy: Minst 8 tecken inkluderat 1 special tecken" 
Do
{
Write-Host
    $isGood = 0
    $Password = Read-Host "Ange lösenordet" -AsSecureString
    $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)
    $Complexity = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

    if ($Complexity.Length -ge $PasswordLength) {
                Write-Host
            } else {
                Write-Host "Password needs $PasswordLength or more Characters" -ForegroundColor:Green
        }

    if ($Complexity -match "[^a-zA-Z0-9]") {
                $isGood++
            } else {
                Write-Host "Lösenordet innehåller inte specialtecken" -ForegroundColor:Green
        }

    if ($Complexity -match "[0-9]") {
                $isGood++
            } else {
                Write-Host "Password does not contain Numbers." -ForegroundColor:Green
        }

    if ($Complexity -cmatch "[a-z]") {
                $isGood++
            } else {
                Write-Host "Password does not contain Lowercase letters." -ForegroundColor:Green
        }

    if ($Complexity -cmatch "[A-Z]") {
                $isGood++
            } else {
                Write-Host "Password does not contain Uppercase letters." -ForegroundColor:Green
        }

} Until ($password.Length -ge $PasswordLength -and $isGood -ge 4)


Write-Host
Read-Host "Tryck Enter för att fortsätta skapa kontot"
Write-Host "Skapar kontot nu, vänligen vänta!" -ForegroundColor:Green

cls
write-host
Do{
    if ($co -eq "Denmark") {
    write-host "Endast för DK användare" -ForegroundColor:Yellow
    $primaryemail = Read-Host "Ska användaren ha $logonname@$Domain som primär inloggnings/mailadress


                        `n

                        `n1) Ja
                        `n2) Nej
                        `n * Välj Nej om en annan önskad adress står i beställningen, annars Ja" 
    }
    else {
        break
    }
}While($primaryemail -notin 1,2)

    switch ($primaryemail) {


        '1' { "Ja"


            if($primaryemail -eq '1') {


                break


                }
            }
        '2' { "Nej"

            if($primaryemail -eq '2') {
                write-host
                $logonname = Read-Host "
                       `nAnge vad som ska stå innan @$Domain" 


                    }
                }


    }


cls


Write-Host
Write-Host "Kontot skapas…" -ForegroundColor:Green
sleep 1
Write-Host "Vänligen vänta!" -ForegroundColor:Green



#Creating user account with the information you inputted.
New-ADUser -Name $fullname -GivenName $firstname -Surname $lastname -DisplayName $fullname -SamAccountName $logonname -UserPrincipalName $logonname@$Domain -AccountPassword $password -Enabled $true -Path $OU -Description $Description -Confirm:$false

sleep 2

set-aduser $logonname -add @{“targetaddress” = “SMTP:” + $logonname + “@svenskfilmindustri.onmicrosoft.com”}

Sleep 2

set-aduser $logonname -add @{“proxyaddresses” = “smtp:” + $logonname + “@svenskfilmindustri.onmicrosoft.com”}

Sleep 3

set-aduser $logonname -add @{“proxyaddresses” = “SMTP:” + $logonname + '@' + $domain}

set-aduser $logonname -add @{“proxyaddresses” = “SIP:” + $logonname + '@' + $domain}

Set-ADUser -identity $logonname -add @{“mail” = $logonname + '@' + $domain} 

Set-ADUser -Identity $logonname -company $Company

Set-ADUser -identity $logonname -manager $Manager

Set-ADUser -identity $logonname -title $title

Set-ADUser -Identity $logonname -replace @{c=$c;co=$co;countrycode=$countrycode;streetAddress=$streetaddress;postalCode=$postalcode;l=$city}

Set-ADUser -identity $logonname -department $Department

Set-ADUser -Identity $logonname -add @{extensionAttribute7=$employmenttype}

# Adding extensionAttribute10 based on the chosen company
switch ($Company)
{
    'AB Svensk Filmindustri' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="556003-5213"}
    }
    'SF Studios Production AB' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="556600-3397"}
    }
    'SF Anytime AB' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="556748-2616"}
    }
    'SF Studios Production ApS' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="26390168"}
    }
    'SF Film A/S' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="21388939"}
    }
    'SF Norge AS' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="947 714 732"}
    }
    'SF Film Finland OY' {
        Set-ADUser -Identity $logonname -Add @{extensionAttribute10="1571957-9"}
    }
}

cls

write-host
Write-Host "Landskod för mobilnummer i de olika länderna:"
Write-Host "========================================================"
Write-Host "Sverige landskod: +46"
Write-Host "Norge landskod:   +47"
Write-Host "Danmark landskod: +45"
Write-Host "Finland landskod: +358"
Write-Host "========================================================"
Write-Host
Write-Host "Finns inte mobilnummer i beställningen, tryck ENTER utan att skriva in något." -ForegroundColor:yellow
Write-Host


$mobile = Read-Host "Skriv in personens mobilnummer: (Med landskod)"
$mobileNr = Get-ADUser -Identity $logonname -Properties mobile | select mobile -ExpandProperty mobile

#Mobile and Phone number formatting
If ($mobile -ne '') {
            If ($mobile.Substring(0, 3) -like "+46" -and $co -eq "Sweden") {
                $mobileNr = $mobile.Replace(" ", "")
                switch ($mobileNr.Length) {
                    11 { $mobile = "+" + [String]::Format('{0:## # ### ## ##}', [bigint]$mobileNr) }
                    12 { $mobile = "+" + [String]::Format('{0:## ## ### ## ##}', [bigint]$mobileNr) }
                    13 { $mobile = "+" + [String]::Format('{0:## ## ### ### ##}', [bigint]$mobileNr) }
                    Default { $mobile = $mobile }
                }
            }
            elseIf ($mobile.Substring(0, 3) -like "+45" -and $co -eq "Denmark") {
                $mobileNr = $mobile.Replace(" ", "")
                switch ($mobileNr.Length) {
                    10 { $mobile = "+" + [String]::Format('{0:## ## ## ## #}', [bigint]$mobileNr) }
                    11 { $mobile = "+" + [String]::Format('{0:## ## ## ## ##}', [bigint]$mobileNr) }
                    12 { $mobile = "+" + [String]::Format('{0:## ## ## ## ## #}', [bigint]$mobileNr) }
                    Default { $mobile = $mobile }
                }
            }
            elseIf ($mobile.Substring(0, 3) -like "+47" -and $co -eq "Norge") {
                $mobileNr = $mobile.Replace(" ", "")
                switch ($mobileNr.Length) {
                    10 { $mobile = "+" + [String]::Format('{0:### ## ## ##}', [bigint]$mobileNr) }
                    11 { $mobile = "+" + [String]::Format('{0:## ## ## ## ##}', [bigint]$mobileNr) }
                    12 { $mobile = "+" + [String]::Format('{0:### ## ## ## ##}', [bigint]$mobileNr) }
                    Default { $mobile = $mobile }
                }
            }
            elseIf ($mobile.Substring(0, 4) -like "+358" -and $co -eq "Finland") {
                $mobileNr = $mobile.Replace(" ", "")
                switch ($mobileNr.Length) {
                    12 { $mobile = "+" + [String]::Format('{0:### ## ##}', [bigint]$mobileNr) }
                    13 { $mobile = "+" + [String]::Format('{0:### ## ### ####}', [bigint]$mobileNr) }
                    14 { $mobile = "+" + [String]::Format('{0:### ### ###}', [bigint]$mobileNr) }
                    Default { $mobile = $mobile }
                }
            }
            elseIf ($mobile.Substring(0, 1) -like "+") {
                $mobileNr = $mobile.Replace(" ", "")
                switch ($mobileNr.Length) {
                    9 { $mobile = "+" + [String]::Format('{0:## ### ###}', [bigint]$mobileNr) }
                    10 { $mobile = "+" + [String]::Format('{0:## ### ## ##}', [bigint]$mobileNr) }
                    11 { $mobile = "+" + [String]::Format('{0:## ### ### ##}', [bigint]$mobileNr) }
                    12 { $mobile = "+" + [String]::Format('{0:## ### ### ###}', [bigint]$mobileNr) }
                    13 { $mobile = "+" + [String]::Format('{0:## ### ### ## ##}', [bigint]$mobileNr) }
                    14 { $mobile = "+" + [String]::Format('{0:## ### ### ### ##}', [bigint]$mobileNr) }
                    Default { $mobile = $mobile }
                }
            }
            else {
                $mobileNr = $mobile.Replace(" ", "")
                switch ($mobileNr.Length) {
                    7 { $mobile = '{0} {1} {2}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 2), $mobileNr.Substring(5, 2) }
                    8 { $mobile = '{0} {1} {2}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 2) }
                    9 { $mobile = '{0} {1} {2}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 3) }
                    10 { $mobile = '{0} {1} {2} {3}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 2), $mobileNr.Substring(8, 2) }
                    11 { $mobile = '{0} {1} {2} {3}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 3), $mobileNr.Substring(9, 2) }
                    12 { $mobile = '{0} {1} {2} {3}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 3), $mobileNr.Substring(9, 3) }
                    13 { $mobile = '{0} {1} {2} {3}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 3), $mobileNr.Substring(9, 2), $mobileNr.Substring(11, 2) }
                    14 { $mobile = '{0} {1} {2} {3}' -f $mobileNr.Substring(0, 3), $mobileNr.Substring(3, 3), $mobileNr.Substring(6, 3), $mobileNr.Substring(9, 3), $mobileNr.Substring(12, 2) }
                    Default { $mobile = $mobile }
                }
            }
        }

#Adding Mobile and Phone number to user
if ($mobile -ne '' -and $co -eq "Sweden") {
    Set-ADUser -Identity $logonname -Add @{mobile=$mobile}
    Write-Host
    Write-Host "Finns inte telefon/växelnummer i beställningen, tryck ENTER utan att skriva in något." -ForegroundColor:yellow
    Write-Host
    $telephoneNumber = Read-Host "Skriv in personens telefon/växelnummer: (Med landskod)"



    }
    else {


    }

If ($null -ne $telephoneNumber -and $co -eq "Sweden") {
            If ($telephoneNumber.Substring(0, 3) -like "+46" -and $co -eq "Sweden") {
                $telephoneNr = $telephoneNumber.Replace(" ", "")
                $telephoneNumber=$telephoneNr
                $telephoneNumber = "+" + [String]::Format('{0:## # ### ## ###}',[bigint]$telephoneNumber)
                switch ($telephoneNr.Length) {
                    11 { $telephoneNumber = "+" + [String]::Format('{0:## # ### ## ###}', [bigint]$telephoneNr) }
                    Default { $telephoneNumber = $telephoneNumber }
                }
                Set-ADUser -Identity $logonname -OfficePhone $telephoneNumber
            }
        }
    else {
    }

if ($mobile -ne '' -and $co -ne "Sweden") {
    Set-ADUser -Identity $logonname -Add @{mobile=$mobile}
    Set-ADUser -Identity $logonname -OfficePhone $mobile
    $telephoneNumber = $mobile

    }
    else {


    }

$accountexpire = Get-ADUser -Identity $logonname -Properties * | Select -ExpandProperty accountexpirationdate
$ADProperties = Get-ADUser $logonname -Properties *

Sleep 4

cls


#Adding extensionattributes
    if (($extensionAttribute8 -eq 'Manager' -or 'ManagerSwe')){

        Set-ADUser -Identity $logonname -add @{extensionAttribute8=$extensionAttribute8}

    } 
    else {



    }

    if (($extensionAttribute8_alt -eq 'NoMailGroups')){

        Set-ADUser -Identity $logonname -add @{extensionAttribute8=$extensionAttribute8_alt}

    }
    else {
        
    }


#Setting account expiration for consultant and temporary users
    if (($employmenttype -ne 'Permanent')){


        Get-ADUser -Identity $logonname | Set-ADAccountExpiration -TimeSpan 182.14:0
    }
    else {



    }

#Setting optional alternative SMTP address for danish users
if (($co -eq "Denmark")){

    Set-aduser $logonname -add @{“proxyaddresses” = “smtp:” + $firstname + '.' + $lastname + '@' + $domain}

    }
    else {



    }

#Adding user to licence groups
if (($employmenttype -eq "Permanent")){

    Add-ADGroupMember -Identity SF-License_Permanent -Members $logonname

    }
    else {
    (($employmenttype -eq "Temporary" -or "Consultant"))

    Add-ADGroupMember -Identity SF-License_ConsultantTemporary -Members $logonname

    }

#Adding user to application groups
function Show-Menu {
    param (
        [string]$TitleMenu = 'SF Studios Applikationer'
    )
    Clear-Host
    Write-Host "================ $TitleMenu ================"
    
    Write-Host "1: Välj '1' för Maccs"
    Write-Host "2: Välj '2' för Filmtrack"
    Write-Host "3: Välj '3' för QlikSense"
    Write-Host "4: Välj '4' för DW"
    Write-Host "5: Välj '5' för Cognos"
    Write-Host "6: Välj '6' för TM1"
    Write-Host "0: Välj '0' för att återgå till kontoskapningen"
}


do
 {
    Show-Menu
    $selection = Read-Host "Vänligen välj dina alternativ"
    switch ($selection)
    {
    '1' {
    	Write-Host "Användaren har lagts till i applikationen: MACCS" -ForegroundColor Green
	Add-ADGroupMember -Identity "MACCS-SWE" -Members $logonname
	Add-ADGroupMember -Identity "MACCS-NOR" -Members $logonname
	Add-ADGroupMember -Identity "MACCS-FIN" -Members $logonname
	Add-ADGroupMember -Identity "MACCS-DNK" -Members $logonname
    } '2' {
     Write-Host "Användaren har lagts till i applikationen: Filmtrack" -ForegroundColor Green
	Add-ADGroupMember -Identity "StarCM User" -Members $logonname
	Add-ADGroupMember -Identity "Avails User" -Members $logonname
    } '3' {
     Write-Host "Användaren har lagts till i applikationen: QlikSense" -ForegroundColor Green
	Add-ADGroupMember -Identity "SF-QlikUsers" -Members $logonname
	} '4' {
     Write-Host "Användaren har lagts till i applikationen: DW" -ForegroundColor Green
	Add-ADGroupMember -Identity "BI Nordic" -Members $logonname
	} '5' {
     Write-Host "Användaren har lagts till i applikationen: Cognos" -ForegroundColor Green
	Add-ADGroupMember -Identity "Cognos BI Register users" -Members $logonname

	} '6' {
     Write-Host "Användaren har lagts till i applikationen: TM1" -ForegroundColor Green
	Add-ADGroupMember -Identity "TM1 Planning Total" -Members $logonname
    }
    }
    pause
 }
until ($selection -eq '0')


#Adding group membership
if (($Department -eq 'HR & Operations - IT') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - IT" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'HR & Operations - Legal') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Legal" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - Theatrical Distribution Sweden') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Biodistribution" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - HE Distribution') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Home Entertainment" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - Distribution Support') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Distribution support" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - Koordination" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - HE" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Production - Production Sweden') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	Add-ADGroupMember -Identity "RW Share – 3V – Tre Vänner" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'SF Anytime - Product') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - SF Anytime" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'SF Anytime - B2B Sales') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - SF Anytime" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'SF Anytime - E-commerce') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - SF Anytime" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Business Controlling') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Ekonomi" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Financial Controlling Production') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Ekonomi" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Royalty') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Ekonomi" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - Ekonomi - Royalty" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Acquisition & Licensing - Acquisition') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Division 2" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}


if (($Department -eq 'Acquisition & Licensing - Licensing Sales & Rights') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Sweden') -or ($co -eq 'Sverige'))
{
	
	Add-ADGroupMember -Identity "RW Share - Licensing Sales and Rights" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - Division 2" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - Theatrical Distribution Denmark') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Denmark') -or ($co -eq 'Danmark'))
{
	
	Add-ADGroupMember -Identity "Bio SF (Marketing - PR)" -Members $logonname
	Add-ADGroupMember -Identity "FaellesDrev" -Members $logonname
	Add-ADGroupMember -Identity "SF Denmark - All" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - HE Distribution') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Denmark') -or ($co -eq 'Danmark'))
{
	
	Add-ADGroupMember -Identity "FaellesDrev" -Members $logonname
	Add-ADGroupMember -Identity "SF Denmark - All" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}


if (($Department -eq 'Production - Production Denmark') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Denmark') -or ($co -eq 'Danmark'))
{
	
	Add-ADGroupMember -Identity "DK PROD RW Share - All" -Members $logonname
	Add-ADGroupMember -Identity "FaellesDrev" -Members $logonname
	Add-ADGroupMember -Identity "SF Denmark - All" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Finance Denmark') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Denmark') -or ($co -eq 'Danmark'))
{
	
	Add-ADGroupMember -Identity "Okonomi" -Members $logonname
	Add-ADGroupMember -Identity "FaellesDrev" -Members $logonname
	Add-ADGroupMember -Identity "SF Denmark - All" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Business Controlling') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Denmark') -or ($co -eq 'Danmark'))
{
	
	Add-ADGroupMember -Identity "Okonomi" -Members $logonname
	Add-ADGroupMember -Identity "FaellesDrev" -Members $logonname
	Add-ADGroupMember -Identity "SF Denmark - All" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - Theatrical Distribution Finland') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Finland') -or ($co -eq 'Suomi'))
{
	
	Add-ADGroupMember -Identity "Teatteriosasto" -Members $logonname
	Add-ADGroupMember -Identity "FI RW Share - All" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname

}

if (($Department -eq 'Distribution - HE Distribution') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Finland') -or ($co -eq 'Suomi'))
{

	Add-ADGroupMember -Identity "FI RW Share - All" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - HE" -Members $logonname
	Add-ADGroupMember -Identity "Luokittelu" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Financial Controlling Production') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Finland') -or ($co -eq 'Suomi'))
{
	
	Add-ADGroupMember -Identity "FI RW Share - Ekonomi" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname

}

if (($Department -eq 'Distribution - Theatrical Distribution Norway') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Norway') -or ($co -eq 'Norge'))
{
	
	Add-ADGroupMember -Identity "NO RW Share - Kino" -Members $logonname
	Add-ADGroupMember -Identity "NO RW Share - Alle" -Members $logonname
	Add-ADGroupMember -Identity "NO List - Alle" -Members $logonname
	Add-ADGroupMember -Identity "NO RW Share - Arkiv Alle Titler" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Distribution - HE Distribution') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Norway') -or ($co -eq 'Norge'))
{
	Add-ADGroupMember -Identity "NO RW Share - Home Entertainment" -Members $logonname
	Add-ADGroupMember -Identity "NO RW Share - Alle" -Members $logonname
	Add-ADGroupMember -Identity "NO List - Alle" -Members $logonname
	Add-ADGroupMember -Identity "NO RW Share - Arkiv Alle Titler" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}

if (($Department -eq 'Finance - Finance Norway') -and ($employmenttype -eq 'Permanent') -and ($co -eq 'Norway') -or ($co -eq 'Norge'))
{
	Add-ADGroupMember -Identity "NO RW Share - Ekonomi" -Members $logonname
	Add-ADGroupMember -Identity "NO RW Share - Alle" -Members $logonname
	Add-ADGroupMember -Identity "NO List - Alle" -Members $logonname
	Add-ADGroupMember -Identity "RW SharePoint - SF Nordic - Finance" -Members $logonname
	Add-ADGroupMember -Identity "RW Share - SF Alla" -Members $logonname
	Add-ADGroupMember -Identity "SF-Intranet-Users" -Members $logonname
}


cls

Write-Host "========================================================"
Write-Host "Kontot är nu skapad med följande uppgifter:"
Write-Host
Write-Host "Förnamn:         $firstname"
Write-Host "Mellannamn:      $middlename"
Write-Host "Efternamn:       $lastname"
Write-Host "Mobil:           $mobile"
Write-Host "Telefon/Växel:   $telephoneNumber"
Write-Host "Display name:    $fullname"
Write-Host "Användarnamn:    $logonname"
Write-Host "OU:              $OU"
Write-Host "Domain:          $domain"
Write-Host "Country:         $co"
Write-Host "Company:         $company"
Write-Host "Department:      $Department"
Write-Host "Manager:         $manager"
Write-Host "Direct Reports:  $ismanager"
Write-Host "Employment Type: $employmenttype"
Write-Host "Expiration Date: $accountexpire"
Write-Host "Konsult/Temporära konton är endast giltiga i 6 månader som standard. Vänligen ändra detta manuellt om det framgår i beställningen" -ForegroundColor:yellow
Write-Host
Write-Host
Read-Host "Tryck ENTER för att avsluta kontoskapningen"



Start-ADSyncSyncCycle -PolicyType Delta
