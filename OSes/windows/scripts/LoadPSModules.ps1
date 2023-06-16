$moduleDir = "$HOME\Documents\WindowsPowerShell\Modules\Utils"

Write-Host "Loading powershell utility functions..."
New-Item $moduleDir -ItemType Directory -Force | Out-Null

Copy-Item -Path ./Utils.psm1 -Destination $moduleDir | Out-Null
Import-Module Utils | Out-Null
