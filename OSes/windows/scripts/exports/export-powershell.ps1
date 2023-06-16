$regex = '\w*PowerShell\w*'
$path = "$HOME\Documents"

$dir = Find-Directory -Path $path -Regex $regex

if (-not $dir) {
    Write-Host "Couldn't find the directory to export the powershell profiles. Creating them now." -ForegroundColor Yellow
    New-Item $HOME\Documents\WindowsPowerShell -ItemType Directory -Force
    New-Item $HOME\Documents\PowerShell -ItemType Directory -Force
    Copy-Item -path ../../powershell/Microsoft.PowerShell_profile.ps1 -Destination $HOME\Documents\PowerShell -Force | Out-Null
    Copy-Item -path ../../powershell/Microsoft.PowerShell_profile.ps1 -Destination $HOME\Documents\PowerShell\Microsoft.VSCode_profile.ps1 -Force | Out-Null
    Copy-Item -path ../../powershell/Microsoft.PowerShell_profile.ps1 -Destination $HOME\Documents\WindowsPowerShell -Force | Out-Null
    Copy-Item -path ../../powershell/Microsoft.PowerShell_profile.ps1 -Destination $HOME\Documents\WindowsPowerShell\Microsoft.VSCode_profile.ps1 -Force | Out-Null
}
else {
    Copy-Item -path ../../powershell/Microsoft.PowerShell_profile.ps1 -Destination $dir -Force | Out-Null
}

Write-Host "Exported powershell profiles successfully." - -ForegroundColor Green
