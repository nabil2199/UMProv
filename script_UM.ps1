<#
User dialin pin setup and notification
Version 0.1
OCWS
CSV file path C:\Users\deploylnc\Desktop\users.csv
#>
<#
param(
        [Parameter(
                    Mandatory=$true,
                    Position=0,
                    HelpMessage='Set CSV path variable')]
        [string] $path
)
#>

$users = $null
$users = Import-CSV C:\Users\NXLX8474\Desktop\users.csv
$count = $users.count
write-host "User count within CSV file=" $count

ForEach ($user in $users) 
{
	Enable-UMMailbox -Identity $user.upn -UMMailboxPolicy "GenFrDialPlan" -Extensions $user.Extension
	if ($?=$true){
		write-host "UM enabled for user:" $user.upn
	}
}