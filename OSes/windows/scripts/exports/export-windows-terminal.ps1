$regex = 'Microsoft\.WindowsTerminal_[^\\]*'
$path = "$env:LOCALAPPDATA\Packages"

$dir = Find-Directory -Path $path -Regex $regex

if (-not $dir) {
   Write-Host "Couldn't find the directory to export the windows terminal settings file. Please ensure Windows Terminal is installed." -ForegroundColor Red
}
else {
    Copy-Item -path ../../terminal/settings.json -Destination $dir\LocalState -Force | Out-Null
    Write-Host "Exported Windows Terminal settings successfully." - -ForegroundColor Green
}
