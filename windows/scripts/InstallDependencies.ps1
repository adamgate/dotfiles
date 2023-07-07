##########################################
#              Entry Point
##########################################
Write-Host "Please plug in your computer. This will take a while." -ForegroundColor Red
Write-Host "Installing Package Managers..." -ForegroundColor "Yellow"
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1')) | Out-Null

refreshenv

Write-Host "Installing Packages..." -ForegroundColor "Yellow"
$status = 0, 0, 0
$status[0] = choco install git -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'"
$status[0] = choco install visualstudio2022community -y --params="'--includeRecommended --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.Azure -add Microsoft.VisualStudio.Workload.ManagedGame -add Microsoft.VisualStudio.Workload.NativeDesktopproductArchx64-add Microsoft.VisualStudio.Workload.NetWebproductArchx64'"

$status[0] = choco install python2 python3 nvm jre8 jdk8 powershell-core microsoft-windows-terminal vscode docker-desktop `
azure-data-studio sql-server-management-studio neovim oh-my-posh powertoys firefox googlechrome discord `
betterdiscord steam obs-studio gimp vlc 7zip.install adobereader `
-y | Out-Null

Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | `New-Item "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force | Out-Null

refreshenv

Invoke-Expression (dotnet tool install -g csharpier)
Invoke-Expression  (oh-my-posh font install CascadiaCode) | Out-Null
Invoke-Expression (nvm install --lts)
Invoke-Expression (nvm use lts)

foreach ($element in $status) {
    if (($element -eq 1) -or ($element -eq -1))
    {
        Write-Host "There was an issue installing one or more apps." -ForegroundColor Red
        return
    }
}

Write-Host "Apps were installed successfully. Please restart your computer as soon as possible." -ForegroundColor Green
