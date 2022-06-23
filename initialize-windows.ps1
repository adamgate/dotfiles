################################################################################
#
# Initialize a new windows machine with my desired file structure and settings 
#
# Last Changed: 6/22/2022
#
################################################################################


# Prompt for user input
$Drive = Read-Host -Prompt 'What drive do you want to intiailize?'
echo ""

# Initialize Directories
echo "Initializing directories in ${drive}: ..."
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Personal
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Sandbox
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Work
New-Item -ItemType Directory -Force -Path ${Drive}:\Code\Misc
New-Item -ItemType Directory -Force -Path ${Drive}:\Tools
echo "Directories intialized."
echo ""

# Pin Directories to File Explorer QuickAccess
echo "Pinning to Quick Access..."
$o = new-object -com shell.application
$o.Namespace("$env:USERPROFILE").Self.InvokeVerb("pintohome") #pin user directory
$o.Namespace("${Drive}:\Code").Self.InvokeVerb("pintohome")
$o.Namespace("${Drive}:\Tools").Self.InvokeVerb("pintohome")
echo "Folders pinned. Don't forget to unpin folders you don't want from File Explorer Quick Access."
echo ""

# Config Files
echo "Installing config files..."
# 
echo "Config files installed."
echo ""

echo "***TODO:***"
echo "Unpin folders you don't want on file explorer quick access"
echo "Enable 'View Hidden Files' in file explorer"
echo "Enable 'View file extensions' in file explorer"
echo ""