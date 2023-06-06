################################################################################
#
# Initialize a new windows machine with my desired file structure and settings 
#
# Last Changed: 6/22/2022
#
################################################################################


# Prompt for user input
$Drive = Read-Host -Prompt 'What drive do you want to intiailize?'
Write-Output ""

# Initialize Directories
Write-Output "Initializing directories in ${drive}: ..."
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Personal | Out-Null
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Sandbox | Out-Null
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Work | Out-Null
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Misc | Out-Null
New-Item -ItemType Directory -Force -Path ${Drive}:\Tools | Out-Null

New-Item -ItemType Directory -Force -Path "$env:LOCALAPPDATA\nvim" | Out-Null
Write-Output "Directories intialized."
Write-Output ""

# Pin Directories to File Explorer QuickAccess
Write-Output "Pinning to Quick Access..."
$o = new-object -com shell.application
$o.Namespace("$env:USERPROFILE").Self.InvokeVerb("pintohome") #pin user directory
$o.Namespace("${Drive}:\Code").Self.InvokeVerb("pintohome")
$o.Namespace("${Drive}:\Tools").Self.InvokeVerb("pintohome")
# TODO:
# -unpin folders
# -make hidden files visible
# -view file extensions
Write-Output "Folders pinned. Don't forget to unpin folders you don't want from File Explorer Quick Access."
Write-Output ""

# Config Files
Write-Output "Installing config files..."

# Install vim-plug
Invoke-WebRequest -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    New-Item "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force | Out-Null
# Copy-Item .\init.vim -Destination ~\.config\nvim
Copy-Item .\init.vim -Destination ~\AppData\Local\nvim
Copy-Item .\.gitconfig -Destination ~
# TODO copy qmk files to appropriate place
# TODO     -windows terminal colors, default settings
Write-Output "Config files installed."
Write-Output ""

Write-Output "***TODO:***"
Write-Output "File Explorer:"
Write-Output "  *Unpin folders you don't want on quick access"
Write-Output "  *Enable 'View Hidden Files'"
Write-Output "  *Enable 'View file extensions'"
Write-Output "Install Programs:"
Write-Output "  *Neovim"