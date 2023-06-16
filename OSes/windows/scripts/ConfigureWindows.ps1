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

Write-Host "Configuring system..." -ForegroundColor Yellow

# Enable WSL2 & install fedora
# Todo- add branching logic based on the presence of the rootfs file
Enable-WindowsOptionalFeature -Online -All -FeatureName VirtualMachinePlatform, Microsoft-Windows-Subsystem-Linux -NoRestart -WarningAction SilentlyContinue | Out-Null
wsl --set-default-version 2 | Out-Null
wsl --update | Out-Null
New-Item -ItemType Directory -Force -Path $HOME\wsl\fedora | Out-Null
wsl --import fedora $HOME\wsl\fedora $HOME\Downloads\fedora-rootfs.tar | Out-Null
wsl -s fedora | Out-Null
Write-Host "WSL2 enabled. Fedora installed and set to default."

# Set File Explorer options
Write-Host "Setting file explorer options..." -ForegroundColor Yellow
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" 1 # Show hidden files by default
Set-ItemProperty "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" 0 # Show file extensions by default
Write-Host "Hidden files and file extensions set to visible."

# Initialize directories
Write-Host "Initializing directories..." -ForegroundColor Yellow
$dirs = @(
    "$HOME\Code",
    "$HOME\Code\Personal",
    "$HOME\Code\Sandbox",
    "$HOME\Code\Others Code",
    "$HOME\Tools",
    "$HOME\Tools\Scripts",
    "$HOME\Files",
    "$HOME\Files\Notes",
    "$HOME\Desktop\Misc Programs",
    "$HOME\Desktop\Loose Games",
    "$HOME\Desktop\Production",
    "$HOME\Desktop\ROMS"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}
Write-Host "Directory setup created."
# TODO - initialize ROMS directory

# Set desktop folder icons
Write-Host "Updating desktop folder icons..." -ForegroundColor Yellow
Update-Folder-Icon -FolderPath $dirs[8] -IconPath ".\icons\gear.ico"
Update-Folder-Icon -FolderPath $dirs[9] -IconPath ".\icons\game-controller.ico"
Update-Folder-Icon -FolderPath $dirs[10] -IconPath ".\icons\production.ico"
Update-Folder-Icon -FolderPath $dirs[11] -IconPath ".\icons\arcade_game.ico"
Write-Host "Desktop folder icons set."

# Pin Directories to File Explorer QuickAccess
Write-Host "Pinning folders to Quick Access..." -ForegroundColor Yellow
$o = new-object -com shell.application
$o.Namespace("$env:USERPROFILE").Self.InvokeVerb("pintohome")
$o.Namespace($dirs[0]).Self.InvokeVerb("pintohome")
$o.Namespace($dirs[4]).Self.InvokeVerb("pintohome")
$o.Namespace($dirs[6]).Self.InvokeVerb("pintohome")
Write-Output "Directories pinned to quick access."
# TODO: unpin unwanted folders

# Export config files to their proper location
Write-Host "Exporting configuration files..." -ForegroundColor Yellow
./exports/export-discord.ps1 -Confirm:$false | Out-Null
./exports/export-git.ps1 -Confirm:$false | Out-Null
./exports/export-omp.ps1 -Confirm:$false | Out-Null
./exports/export-powershell.ps1 -Confirm:$false | Out-Null
./exports/export-vim.ps1 -Confirm:$false | Out-Null
./exports/export-vscode.ps1 -Confirm:$false | Out-Null
./exports/export-windows-terminal.ps1 -Confirm:$false | Out-Null
Write-Host "Configuration files exported."

Write-Host "System configuration complete." -ForegroundColor Green
