Write-Host "Before you can run this script you'll have use the following command: Set-ExecutionPolicy Restricted"

LoadPSModules.ps1

Check-Intent
Ensure-Admin-Privileges

InstallDependencies.ps1
ConfigureWindows.ps1
