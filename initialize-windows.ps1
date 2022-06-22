# Prompt for user input
$Drive = Read-Host -Prompt 'What drive do you want to intiailize?'

# Initialize Directories
echo "Initializing directories in ${drive}: ..."
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Personal
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Sandbox
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Work
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Misc
New-Item -ItemType Directory -Force -Path ${Drive}:\Tools
echo "Directories intialized."

# Pin Directories to File Explorer QuickAccess
echo "Pinning to Quick Access..."
$o = new-object -com shell.application
$o.Namespace("${Drive}:\Users\$env:userprofile").Self.InvokeVerb("pintohome") #pin user directory
$o.Namespace("${Drive}:\Code").Self.InvokeVerb("pintohome")
$o.Namespace("${Drive}:\Tools").Self.InvokeVerb("pintohome")
echo "Folders pinned. Don't forget to unpin folders you don't want from File Explorer Quick Access."

# Config Files
echo "Installing config files..."
# 
echo "Config files installed."