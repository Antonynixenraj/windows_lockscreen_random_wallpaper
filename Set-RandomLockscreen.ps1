$script="<script_location>"

Start-Process powershell.exe -Argument "-Verb runAsAdministrator -File $script" -Wait

# Path to the folder containing your wallpapers
$wallpaperFolder = "<Upcoming_wallapers_Folder>"

$files=Get-ChildItem -Path $wallpaperFolder -File | Select-Object -ExpandProperty Name

$image=Get-Random -InputObject $files

$imagePath_toset=Join-Path $wallpaperFolder -ChildPath $image

# To get unique Wallpaper Images
cp "$imagePath_toset" "<Current_Wallpaper_Folder> \Lockscreen.jpg"

rm "$imagePath_toset"

$imagePath = "<Current_Wallpaper_Folder> \Lockscreen.jpg"

# Set Lockscreen Wallpaper
$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
if (!(Test-Path -Path $Key)) {
   New-Item -Path $Key -Force | Out-Null
}
Set-ItemProperty -Path $Key -Name LockScreenImagePath -value $imagePath

# If images are over it will restore automatically 
if ((Get-ChildItem -Path $wallpaperFolder | Measure-Object).Count -eq 0) {
   cp "<path_to_image_folder>\*" "$wallpaperFolder"
}
