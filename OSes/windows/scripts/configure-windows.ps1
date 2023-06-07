# Check to see if we are currently running as Admin
if (!(Verify-Elevated)) {
    $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";
    $newProcess.Arguments = $myInvocation.MyCommand.Definition;
    $newProcess.Verb = "runas";
    [System.Diagnostics.Process]::Start($newProcess);
 
    exit
}

Write-Host "Configuring system.." -ForegroundColor "Yellow"

# Enable WSL2
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -WarningAction SilentlyContinue | Out-Null


# Explorer: Show hidden files by default: Show Files: 1, Hide Files: 2
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1

# Explorer: Show file extensions by default: Hide: 1, Show: 0
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

# Initialize Directories
Write-Host "Initializing directories in ${HOME}: ..." -ForegroundColor "Yellow"
New-Item -ItemType Directory -Force -Path ${HOME}\Code\Personal | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Code\Sandbox | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Tools | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Tools\Scripts | Out-Null

# Pin Directories to File Explorer QuickAccess
Write-Output "Pinning to Quick Access..." -ForegroundColor "Yellow"
$o = new-object -com shell.application
$o.Namespace("$env:USERPROFILE").Self.InvokeVerb("pintohome") #pin user directory
$o.Namespace("${Drive}:\Code").Self.InvokeVerb("pintohome")
$o.Namespace("${Drive}:\Tools").Self.InvokeVerb("pintohome")
# TODO: unpin unwanted folders

# Config Files 
Write-Output "Installing config files..." -ForegroundColor "Yellow"
# oh my posh themes
# powershell configs
    # oh my posh theme
    # font
# windows terminal themes & settings
# neovim config
# browser startpage
# betterdiscord & spicetify themes
# .gitconfig
# Organize icons on desktop??