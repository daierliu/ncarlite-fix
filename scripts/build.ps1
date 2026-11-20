# Build NeteaseCarLite-v1.0.0-loginfix.apk
# Re-decompiles the original APK, overlays patched smali files, rebuilds, aligns, signs.
# ASCII only. Must run on Windows PowerShell 5.1+.
param(
    [switch]$Install
)
$ErrorActionPreference = "Stop"

$proj  = Split-Path -Parent $PSScriptRoot          # project root (ncarlite-fix)
$tools = Join-Path $proj "..\wyy431-loginfix\tools"
$apktool = Join-Path $tools "apktool.jar"
$jre = Join-Path $tools "jre17\bin"
$bt  = Join-Path $tools "buildtools\android-14"
$ks  = Join-Path $tools "hybrid.keystore"
$adb = Join-Path $tools "platform-tools\adb.exe"

$env:PATH = "$jre;$env:PATH"

# ASCII staging area (apktool fails on non-ASCII paths)
$stage = "C:\Temp\carlite"
New-Item -ItemType Directory -Force "$stage\apk" | Out-Null

$srcApk = Join-Path $proj "apk\NeteaseCarLite-v1.0.0.apk"
$outApk = Join-Path $proj "out\NeteaseCarLite-v1.0.0-loginfix.apk"
$work = "$stage\work"

Write-Output "[1/7] stage source apk"
Copy-Item $srcApk "$stage\apk\" -Force

Write-Output "[2/7] apktool decode"
java -jar $apktool d -f -o $work "$stage\apk\NeteaseCarLite-v1.0.0.apk" | Out-Null
if ($LASTEXITCODE -ne 0) { throw "apktool decode failed" }

# Bump versionCode so the car unit's install policy allows overwrite installs.
# The counter is persisted across builds (car is installed with previous +1).
$ymlPath = Join-Path $work "apktool.yml"
$yml = Get-Content $ymlPath -Raw
$verFile = Join-Path $proj "scripts\versionCode.txt"
$cur = if (Test-Path $verFile) { [int](Get-Content $verFile -Raw) } else { 2 }
$new = $cur + 1
$code = [regex]::Match($yml, "versionCode: (\d+)").Groups[1].Value
$yml = $yml.Replace("versionCode: $code", "versionCode: $new")
Set-Content -Path $ymlPath -Value $yml -Encoding utf8 -NoNewline
Set-Content -Path $verFile -Value $new -Encoding ascii -NoNewline
Write-Output "    versionCode: $cur -> $new"

Write-Output "[3/7] overlay patched smali + res + manifest"
Copy-Item (Join-Path $proj "patch\smali\com\car\musiclite\*") "$work\smali\com\car\musiclite\" -Force
if (Test-Path (Join-Path $proj "patch\res")) {
    Copy-Item (Join-Path $proj "patch\res\*") "$work\res\" -Recurse -Force
}
if (Test-Path (Join-Path $proj "patch\AndroidManifest.xml")) {
    Copy-Item (Join-Path $proj "patch\AndroidManifest.xml") "$work\AndroidManifest.xml" -Force
}

Write-Output "[4/7] apktool build"
java -jar $apktool b $work -o "$stage\unsigned.apk" | Out-Null
if ($LASTEXITCODE -ne 0) { throw "apktool build failed" }

Write-Output "[5/7] zipalign"
& (Join-Path $bt "zipalign.exe") -f -p 4 "$stage\unsigned.apk" "$stage\aligned.apk"
if ($LASTEXITCODE -ne 0) { throw "zipalign failed" }

Write-Output "[6/7] apksigner sign (v1+v2+v3, keystore: hybrid / amaphybrid)"
java -jar (Join-Path $bt "lib\apksigner.jar") sign `
    --ks $ks --ks-pass pass:android --ks-key-alias amaphybrid --key-pass pass:android `
    --v1-signing-enabled true --v2-signing-enabled true --v3-signing-enabled true `
    --out "$stage\signed.apk" "$stage\aligned.apk"
if ($LASTEXITCODE -ne 0) { throw "apksigner failed" }

Write-Output "[7/7] verify + publish"
java -jar (Join-Path $bt "lib\apksigner.jar") verify --print-certs "$stage\signed.apk" | Select-Object -First 4
New-Item -ItemType Directory -Force (Join-Path $proj "out") | Out-Null
Copy-Item "$stage\signed.apk" $outApk -Force
Write-Output "OK -> $outApk"

if ($Install) {
    Write-Output "[install] adb connect 10.238.95.238:5555"
    $env:ANDROID_ADB_SERVER_PORT = "5557"
    & $adb connect 10.238.95.238:5555
    & $adb devices
    & $adb -s 10.238.95.238:5555 install -r $outApk
    if ($LASTEXITCODE -ne 0) { throw "adb install failed" }
    Write-Output "installed"
}
