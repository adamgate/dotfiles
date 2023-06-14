Write-Host "Before you can run this script you'll have use the following command: Set-ExecutionPolicy Restricted"

./LoadPSModules.ps1 -Confirm:$false

Check-Intent
Ensure-Admin-Privileges

if (-not (Test-Internet-Connection)) {
    Write-Host "You aren't connected to the internet. Please connect and try again."
    exit
}

./InstallDependencies.ps1  -Confirm:$false
./ConfigureWindows.ps1  -Confirm:$false

$confirmation = Read-Host "System initialization has finished. A system reboot is recommended. Would you like to do that now?"
if ($confirmation -eq 'y') {
    Restart-Computer
}