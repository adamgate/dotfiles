./LoadPSModules.ps1 -Confirm:$false

Write-Host "Please ensure you have the file 'fedora-rootfs.tar' in the Downloads directory. Otherwise WSL2 won't be completely enabled." -ForegroundColor Magenta

Get-Intent
Grant-AdminPrivileges

if (-not (Test-InternetConnection)) {
    Write-Host "You aren't connected to the internet. Please connect and try again." -ForegroundColor Red
    exit
}

./InstallDependencies.ps1 -Confirm:$false
./ConfigureWindows.ps1 -Confirm:$false

$confirmation = Read-Host "System initialization has finished. A system reboot is recommended. Would you like to do that now?"
if ($confirmation -eq 'y') {
    Restart-Computer
}
