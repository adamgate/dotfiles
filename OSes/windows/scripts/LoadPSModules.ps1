$moduleDir = "$HOME\Documents\WindowsPowerShell\Modules\Utils"

Write-Host "Loading powershell utility functions..."
New-Item $moduleDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./utils.psm1 -Destination $moduleDir
Import-Module Utils | Out-Null
