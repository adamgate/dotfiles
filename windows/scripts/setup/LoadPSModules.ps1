$moduleDirs = @("$HOME\Documents\WindowsPowerShell\Modules\Utils",
               "$HOME\Documents\PowerShell\Modules\Utils"
)

Write-Host "Loading custom powershell modules..."

foreach($dir in $moduleDirs) {
    New-Item $dir -ItemType Directory -Force | Out-Null
    Copy-Item -Path ./Utils.psm1 -Destination $dir | Out-Null
}

Import-Module Utils | Out-Null
Write-Host "Successfully loaded custom powershell modules." -ForegroundColor Green
