# TODO- make this work
# Updates a folder's icon with the provided one
function Update-Folder-Icon ($FolderPath, $IconPath) {
    $WScriptShell = New-Object -ComObject WScript.Shell
    $shortcut = $WScriptShell.CreateShortcut($FolderPath)
    # $shortcut.TargetPath = $IconPath
    $shortcut.IconLocation = $IconPath
    $shortcut.Save()
}


##########################################
#              Entry Point
##########################################

Write-Host "Configuring system..." -ForegroundColor "Yellow"

# TODO- remove this (needs testing in VM first)
exit 

# Enable WSL2
Enable-WindowsOptionalFeature -Online -All -FeatureName VirtualMachinePlatform, Microsoft-Windows-Subsystem-Linux -NoRestart -WarningAction SilentlyContinue | Out-Null
wsl --set-default-version 2
Write-Host "WSL2 enabled."

# Show hidden files by default
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1

# Show file extensions by default
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0

Write-Host "Hidden files and file extensions set to visible."

# Initialize Directories
Write-Host "Initializing directories in ${HOME}: ..." -ForegroundColor "Yellow"
New-Item -ItemType Directory -Force -Path ${HOME}\Code | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Code\Personal | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Code\Sandbox | Out-Null
New-Item -ItemType Directory -Force -Path "${HOME}\Code\Others Code" | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Tools | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Tools\Scripts | Out-Null
New-Item -ItemType Directory -Force -Path ${HOME}\Files | Out-Null

New-Item -ItemType Directory -Force -Path "${HOME}\Desktop\Misc Programs" | Out-Null
New-Item -ItemType Directory -Force -Path "${HOME}\Desktop\Loose Games" | Out-Null
New-Item -ItemType Directory -Force -Path "${HOME}\Desktop\Production" | Out-Null
New-Item -ItemType Directory -Force -Path "${HOME}\Desktop\ROMS" | Out-Null
# TODO - initialize ROMS directory

Write-Host "Custom directory setup created."

# Set icons if they're available
# TODO - move the icons to this repository
$iconPath = "..\..\cross platform\Icons\ICO"
if ((Test-Path -Path $iconPath)) {
    Update-Folder-Icon -FolderPath "${HOME}\Desktop\Misc Programs" -IconPath "${iconPath}\gear.ico"
    Update-Folder-Icon -FolderPath "${HOME}\Desktop\Loose Games" -IconPath "${iconPath}\game-controller.ico"
    Update-Folder-Icon -FolderPath "${HOME}\Desktop\Production" -IconPath "${iconPath}\digital-art.ico"
    Update-Folder-Icon -FolderPath "${HOME}\Desktop\ROMS" -IconPath "${iconPath}\arcade_game_cabinet_S1C_icon.ico"
    Write-Host "Desktop folder icons set."
}
else {
    Write-Host "Couldn't find the icons folder. Ensure Dropbox is installed and set the icons yourself." -ForegroundColor Red
}

# Pin Directories to File Explorer QuickAccess
$o = new-object -com shell.application
$o.Namespace("$env:USERPROFILE").Self.InvokeVerb("pintohome")
$o.Namespace("${HOME}:\Code").Self.InvokeVerb("pintohome")
$o.Namespace("${HOME}:\Tools").Self.InvokeVerb("pintohome")
$o.Namespace("${HOME}:\Files").Self.InvokeVerb("pintohome")
Write-Output "Custom directories pinned to quick access."
# TODO: unpin unwanted folders

# Export config files to their proper location
Write-Output "Installing config files..." -ForegroundColor "Yellow"
# oh my posh themes
# powershell configs
# oh my posh theme
# nerd font
# windows terminal themes & settings
# neovim config
# browser startpage
# betterdiscord & spicetify themes
# .gitconfig
# Organize icons on desktop??