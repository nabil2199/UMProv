<#
User dialin pin setup and notification
Version 0.1
OCWS
CSV file path C:\Users\deploylnc\Desktop\users.csv
#>
param([string]$userCsv = "C:\Sources\users.csv",[string]$UMPolicy = "C:\Sources\ProvisioningPIN.csv")

$users = $null
$users = Import-Csv $userCsv
$count = $users.count
Write-Host "User count within CSV file=" $count

foreach ($user in $users)
{
  if ($user.VoiceMail -eq "Y")
  {
    Set-Mailbox -Identity $user.upn -Languages fr-FR
    Enable-UMMailbox -identity $user.upn -UMMailboxPolicy $UMPolicy -Extensions $user.Extension
    if ($? -eq $true) {
      Write-Host "UM enabled for user:" $user.upn
    }
  }
}
