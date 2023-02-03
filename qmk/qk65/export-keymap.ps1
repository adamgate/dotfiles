# copy all items in the folder to the destination
Copy-Item * -Destination "$env:USERPROFILE\qmk_firmware\keyboards\qwertykeys\qk65\keymaps\AdamApplegate" -Include *.h,*.c,*.mk

Write-Host "Successfully exported keymap." -ForegroundColor Green