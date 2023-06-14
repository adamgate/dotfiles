##########################################
#              Entry Point
##########################################

Write-Host "Installing Package Managers..." -ForegroundColor "Yellow"
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Update-SessionEnvironment

Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
Install-Module -Name Posh-Git -Scope CurrentUser -Force


Write-Host "Installing Packages..." -ForegroundColor "Yellow"
choco install git            -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'"
choco install python2        -y
choco install python3        -y
choco install nvm            -y  # choco install nodejs.install -y
choco install jre8           -y
choco install jdk8           -y

choco install powershell-core              -y
choco install microsoft-windows-terminal   -y
choco install visualstudio2022community    -y --params="'--includeRecommended --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.Azure -add Microsoft.VisualStudio.Workload.ManagedGame -add Microsoft.VisualStudio.Workload.NativeDesktopproductArchx64-add Microsoft.VisualStudio.Workload.NetWebproductArchx64'"
choco install vscode                       -y
choco install docker-desktop               -y
choco install azure-data-studio            -y
choco install sql-server-management-studio -y
choco install neovim                       -y
choco install oh-my-posh                   -y
choco install powertoys                    -y
# TODO: find a way to download FancyWM

choco install firefox       -y
choco install googlechrome  -y
choco install discord       -y
choco install betterdiscord -y
choco install spotify       -y
choco install spicetify-cli -y
choco install dropbox       -y
choco install steam         -y
choco install obs-studio    -y
choco install gimp          -y

choco install vlc          -y
choco install 7zip.install -y
choco install adobereader  -y

Update-SessionEnvironment

oh-my-posh font install CascadiaCode | Out-Null
nvm install --lts

# Install vim-plug
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | `New-Item "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force | Out-Null
