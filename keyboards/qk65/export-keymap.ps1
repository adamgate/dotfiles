# Create the folder structure if it doesn't exist
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\qmk_firmware\keyboards\qwertykeys\qk65\hotswap\keymaps\AdamApplegate"

# copy all items in the folder to the destination
Copy-Item * -Destination "$env:USERPROFILE\qmk_firmware\keyboards\qwertykeys\qk65\hotswap\keymaps\AdamApplegate" -Include *.h,*.c,*.mk

Write-Host "Successfully exported keymap." -ForegroundColor Green