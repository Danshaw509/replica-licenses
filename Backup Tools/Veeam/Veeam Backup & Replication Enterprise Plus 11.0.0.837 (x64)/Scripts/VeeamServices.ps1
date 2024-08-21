Clear-Host

Write-Host ''
Write-Host  'Veeam Service Status'
Write-Host  ''
Write-Host  'Menu:'
Write-Host  '[1]: List Veeam service status'
Write-Host  '[2]: Stop Veeam services'
Write-Host  '[3]: Start Veeam services'
Write-Host  '[Q]: Quit'


function StopVeeam
{
  (Get-Service -DisplayName Veeam* | Stop-Service -Verbose)
}

function StartVeeam
{
  (Get-Service -DisplayName Veeam* | Start-Service -Verbose)
}


function ListVeeam
{
  (Get-Service -DisplayName veeam*)
}


$Nullstring = '{0}'

$choix = Read-Host -Prompt 'Choice?'
if (($Nullstring -f $choix) -eq '1')
{
  ListVeeam
}


elseif (($Nullstring -f $choix) -eq '2')
{
  StopVeeam
}


elseif (($Nullstring -f $choix) -eq '3')
{
  StartVeeam
}


elseif (($Nullstring -f $choix) -eq 'q')
{
  exit
}
else
{
  Write-Host  'Invalid Selection!'
}