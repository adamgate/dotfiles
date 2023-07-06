$regex = '[^\\]*FancyWM[^\\]*'
$path = "$env:LOCALAPPDATA\Packages"

$dir = Find-Directory -Path $path -Regex $regex

if (-not $dir) {
   Write-Host "Couldn't find the directory to export the Fancy Window Manager settings file. Please ensure FancyWM is installed." -ForegroundColor Red
}
else {
    Copy-Item -path ../fancyWM/settings.json -Destination $dir\LocalCache\Roaming\FancyWM -Force | Out-Null
    Write-Host "Exported Fancy Window Manager settings successfully." -ForegroundColor Green
}
