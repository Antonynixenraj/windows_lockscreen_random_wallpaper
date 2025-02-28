$script="C:\LockScreen\Scripts"

Start-Process powershell.exe -Argument "-Verb runAsAdministrator -File $script" -Wait

$jsonFilePath = "C:\LockScreen\json\Lockscreen_Wallpaper.json"  # Replace with your JSON file path instead of "C:\LockScreen\json\Lockscreen_Wallpaper.json"
$wallpaperFolder = "C:\LockScreen\Wallpaper_images"  # Replace with your folder path instead of "C:\LockScreen\Wallpaper_images"

$jsonData = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json

# Extract the "ImageNames" array
$imageNames = $jsonData.ImageNames

# Randomly select a file name from the array
$image = $imageNames | Get-Random

# Output the randomized file's fullpath 
$imagePath = Join-Path $wallpaperFolder -ChildPath $image

# Set Lockscreen Wallpaper
$Key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\PersonalizationCSP'
if (!(Test-Path -Path $Key)) {
   New-Item -Path $Key -Force | Out-Null
}
Set-ItemProperty -Path $Key -Name LockScreenImagePath -value $imagePath

$updatedImageNames = $imageNames | Where-Object { $_ -ne $image }

$jsonData.ImageNames = $updatedImageNames

$updatedJsonData = $jsonData | ConvertTo-Json -Depth 3

Set-Content -Path $jsonFilePath -Value $updatedJsonData

$jsonContent = Get-Content -Path $jsonFilePath -Raw

# It restore Files from Wallpaper folder after it gets over
if ($imageNames.Count -eq 1) {

    $files = Get-ChildItem -Path $wallpaperFolder -File

    $fileNames = @()

    foreach ($file in $files) {
        $fileNames += $file.Name
    }

    $jsonData = @{ ImageNames = $fileNames } | ConvertTo-Json -Depth 3
    Set-Content -Path $jsonFilePath -Value $jsonData
}
