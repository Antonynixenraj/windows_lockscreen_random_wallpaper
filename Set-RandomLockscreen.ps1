$script="<script_location>"

Start-Process powershell.exe -Argument "-Verb runAsAdministrator -File $script" -Wait

$wallpaperFolder = "<path_to_image_folder>" # Change Path to the folder containing your wallpapers

#Randomization of image from a folder
$files=Get-ChildItem -Path $wallpaperFolder -File | Select-Object -ExpandProperty Name

$image=Get-Random -InputObject $files

$imagePath_toset=Join-Path $wallpaperFolder -ChildPath $image

# Set Lockscreen Wallpaper
$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
if (!(Test-Path -Path $Key)) {
   New-Item -Path $Key -Force | Out-Null
}
Set-ItemProperty -Path $Key -Name LockScreenImagePath -value $imagePath
