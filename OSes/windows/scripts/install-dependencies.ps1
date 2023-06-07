# Check to see if we are currently running as Admin
if (!(Verify-Elevated)) {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
 
    exit
}


# Get Package Managers
Write-Host "Installing Package Managers..." -ForegroundColor "Yellow"
Get-PackageProvider Chocolatey -Force | Out-Null
Get-PackageProvider NuGet -Force | Out-Null
Get-PackageProvider Winget -Force | Out-Null
# Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Refresh-Environment


# Install PowerShell Modules
Write-Host "Installing PowerShell Modules..." -ForegroundColor "Yellow"
# Install-Module Posh-Git -Scope CurrentUser -Force


# Install Applications
Write-Host "Installing Packages..." -ForegroundColor "Yellow"
choco install git            -y --params="'/GitAndUnixToolsOnPath /NoAutoCrlf'"
choco install python2        -y
choco install python3        -y
choco install nvm            -y
# choco install nodejs.install -y
nvm install --lts
choco install javaruntime    -y
choco install jdk8           -y

choco install powershell-core              -y
choco install microsoft-windows-terminal   -y
choco install visualstudio2022community    -y --params="--includeRecommended --add Microsoft.VisualStudio.Workload.Data --add Microsoft.VisualStudio.Workload.Azure -add Microsoft.VisualStudio.Workload.ManagedGame -add Microsoft.VisualStudio.Workload.NativeDesktopproductArchx64-add Microsoft.VisualStudio.Workload.NetWebproductArchx64"
choco install vscode                       -y
choco install docker-desktop               -y
choco install azure-data-studio            -y
choco install sql-server-management-studio -y
choco install neovim                       -y
choco install oh-my-posh                   -y
choco install powertoys                    -y

# Install vim-plug
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | `New-Item "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force | Out-Null

choco install firefox       -y
choco install discord       -y
choco install betterdiscord -y
choco install spotify       -y
choco install spicetify-cli -y
choco install dropbox       -y
choco install steam         -y

choco install vlc       -y
choco install 7zip      -y

# TODO: find a way to download FancyWM

Refresh-Environment

oh-my-posh font install CascadiaCode | Out-Null