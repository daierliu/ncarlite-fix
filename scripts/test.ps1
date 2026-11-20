# Test NeteaseCarLite login-fix on the car unit over adb (WiFi/tcprelay).
# Steps: connect -> check app -> launch -> capture logcat -> read login prefs (root).
# ASCII only.
param(
    [string]$CarIp = "10.238.95.238",
    [int]$CarPort = 5555,
    [int]$LogSeconds = 40
)
$ErrorActionPreference = "Continue"

$tools = Join-Path (Split-Path -Parent $PSScriptRoot) "..\wyy431-loginfix\tools"
$adb = Join-Path $tools "platform-tools\adb.exe"
$env:ANDROID_ADB_SERVER_PORT = "5557"

Write-Output "=== 1. connect $CarIp`:$CarPort ==="
& $adb connect "${CarIp}:${CarPort}"
& $adb devices

$serial = "${CarIp}:${CarPort}"

Write-Output "=== 2. is the target app installed? ==="
& $adb -s $serial shell pm list packages com.car.musiclite

Write-Output "=== 3. clear logcat, launch app ==="
& $adb -s $serial logcat -c
& $adb -s $serial shell am force-stop com.car.musiclite
& $adb -s $serial shell am start -n com.car.musiclite/.MainActivity
Start-Sleep -Seconds 3

Write-Output "=== 4. logcat ($LogSeconds s, MusicLite tags) ==="
$job = Start-Job -ScriptBlock {
    param($adb)
    & $adb logcat -d -t 500 | Select-String -Pattern "MusicLite|car.musiclite"
} -ArgumentList $adb
# give the app time to fire unikey/poll requests
Start-Sleep -Seconds $LogSeconds
Receive-Job $job | Select-Object -First 60
Remove-Job $job -Force

Write-Output "=== 5. login prefs (needs root) ==="
& $adb -s $serial shell su -c "cat /data/data/com.car.musiclite/shared_prefs/ncm.xml" 2>$null
