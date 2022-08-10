# copy all items in the folder to the destination
Copy-Item * -Destination "$env:USERPROFILE\qmk_firmware\keyboards\qwertykeys\qk65\keymaps\AdamApplegate" -Include *.h,*.c,*.mk
# Copy-Item * -Destination "..\..\..\qmk_firmware\keyboards\keebio\iris\keymaps\AdamApplegate" -Include *.h,*.c,*.mk

# delete the powershell script that was moved over
# Remove-Item -Path C:\Users\Adam\qmk_firmware\keyboards\keebio\iris\keymaps\AdamApplegate -Include *.ps1

Read-Host -Prompt "Press enter to exit"