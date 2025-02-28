$folderPath = "C:\LockScreen\Wallpaper_images"  # Replace with your folder path instead of "C:\LockScreen\Wallpaper_images"
$jsonFilePath = "C:\LockScreen\json\Lockscreen_Wallpaper.json"  # Replace with your desired output JSON file path instead of "C:\LockScreen\json\Lockscreen_Wallpaper.json"

$files = Get-ChildItem -Path $folderPath -File
$fileNames = @()

foreach ($file in $files) {
    $fileNames += $file.Name
}
$jsonData = @{ ImageNames = $fileNames } | ConvertTo-Json -Depth 3

Set-Content -Path $jsonFilePath -Value $jsonData

$jsonData = Get-Content -Path $jsonFilePath -Raw | ConvertFrom-Json

if ($jsonData.ImageNames -is [System.Collections.IEnumerable]) {
    $elementCount = $jsonData.ImageNames.Count
    Write-Host "Number of images : $elementCount"
    $scriptPath = $MyInvocation.MyCommand.Path
    Remove-Item -Path $scriptPath -Force

} else {
    Write-Host "No images found"
}