$regex = 'sainhe\.everforest-[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,2}'
$path = "$HOME\.vscode\extensions"

$dir = Find-Directory -Path $path -Regex $regex

if (-not $dir) {
   Write-Host "Couldn't find the directory to export the vscode themes. Please ensure the extensions are installed." -ForegroundColor Red
}
else {
    # Copy-Item -path ../../../cross-platform/vscode/everforest-dark.json -Destination $dir\themes -Force | Out-Null
    Write-Host "Exported vscode themes successfully." - -ForegroundColor Green
}
