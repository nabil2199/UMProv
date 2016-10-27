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
$users = Import-Csv C:\Users\NXLX8474\Desktop\users.csv
$count = $users.count
Write-Host "User count within CSV file=" $count

foreach ($user in $users)
{
  if ($user.VoiceMail -eq "Y")
  {
    Enable-UMMailbox -identity $user.upn -UMMailboxPolicy "GenFrDialPlan" -Extensions $user.Extension
    if ($? -eq $true) {
      Write-Host "UM enabled for user:" $user.upn
    }
  }
}
