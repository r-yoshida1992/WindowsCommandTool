# Read "setting.json".
$json = ConvertFrom-Json -InputObject (Get-Content .\setting.json -Raw)
$appName = $Args[0]
$applicationPath = $json.path.$appName

if ($applicationPath.length -eq 0) {
    Write-Warning ("Please set the full path of the " + $appName + ".exe in setting json.")
    exit
}

# Move to application directory.
Set-Location ($applicationPath -ireplace ($appName + ".exe"), "")
# Launch application.
Start-Process ($appName + ".exe")