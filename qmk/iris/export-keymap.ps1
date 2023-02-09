# Create the folder structure if it doesn't exist
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\qmk_firmware\keyboards\keebio\iris\keymaps\AdamApplegate"


# copy the keymap files in the folder to the destination
Copy-Item * -Destination "$env:USERPROFILE\qmk_firmware\keyboards\keebio\iris\keymaps\AdamApplegate" -Include *.h,*.c,*.mk
Copy-Item * -Destination "..\..\..\qmk_firmware\keyboards\keebio\iris\keymaps\AdamApplegate" -Include *.h,*.c,*.mk

Write-Host "Successfully exported keymap." -ForegroundColor Green