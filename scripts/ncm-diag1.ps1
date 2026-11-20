# Diagnose: is weapi crypto OK? does the qrcode endpoint need a real csrf cookie?
$ErrorActionPreference = "Stop"
. "$PSScriptRoot\ncm-lib.ps1"

Write-Output "=== A: GET https://music.163.com/ to obtain __csrf (real web flow) ==="
$csrf = Get-Csrf
Write-Output "csrf = $csrf"
Write-Output ""

Write-Output "=== B: sanity check weapi crypto on /weapi/v3/song/detail (known endpoint) ==="
$r = Post "/v3/song/detail" ('{"ids":"[347230]","csrf_token":"' + $csrf + '"}')
Write-Output ($r.Substring(0, [Math]::Min(300, $r.Length)))
Write-Output ""

Write-Output "=== C: unikey type=3 WITH real csrf cookie ==="
$r = Post "/login/qrcode/unikey" '{"type":3}'
Write-Output $r
Write-Output ""

Write-Output "=== D: unikey type=1 WITH real csrf cookie ==="
$r = Post "/login/qrcode/unikey" '{"type":1}'
Write-Output $r
