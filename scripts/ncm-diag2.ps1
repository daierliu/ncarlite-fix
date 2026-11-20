$ErrorActionPreference = "Stop"
. "$PSScriptRoot\ncm-lib.ps1"

function RawPost([string]$url, [string]$body) {
    $req = [System.Net.HttpWebRequest]::Create($url)
    $req.Method = "POST"
    $req.ContentType = "application/x-www-form-urlencoded"
    $req.UserAgent = $UA
    $req.Referer = "https://music.163.com/"
    $req.Headers.Add("Origin", "https://music.163.com")
    $req.Headers.Add("Cookie", (Cookie))
    $req.Timeout = 15000
    $bs = [Text.Encoding]::UTF8.GetBytes($body)
    $rs = $req.GetRequestStream()
    $rs.Write($bs, 0, $bs.Length); $rs.Close()
    $resp = $req.GetResponse()
    $sc = @()
    foreach ($h in $resp.Headers.AllKeys) {
        if ($h -ieq "Set-Cookie") { $sc += ($resp.Headers.GetValues($h) -join " | ") }
    }
    $ms = New-Object System.IO.MemoryStream
    $resp.GetResponseStream().CopyTo($ms)
    Write-Output ("SC: " + ($sc -join " ; "))
    [Text.Encoding]::UTF8.GetString($ms.ToArray())
}

Write-Output "=== 1. weapi garbage params (what does decrypt-fail look like?) ==="
RawPost "https://music.163.com/weapi/v3/song/detail?csrf_token=" "params=AAAABBBB&encSecKey=CCCC"
Write-Output ""

Write-Output "=== 2. weapi /w/nuser/account/get (account endpoint) ==="
$r = Post "/w/nuser/account/get" "{}"
Write-Output $r
Write-Output ""

Write-Output "=== 3. weapi /song/detail (non-v3, app uses this) ==="
$r = Post "/song/detail" '{"ids":"[347230]"}'
Write-Output ($r.Substring(0, [Math]::Min(200, $r.Length)))
Write-Output ""

Write-Output "=== 4. unikey type=1 again (post account-get, csrf maybe captured) ==="
Write-Output ("CSRF now: " + $script:CSRF)
$r = Post "/login/qrcode/unikey" '{"type":1}'
Write-Output $r
