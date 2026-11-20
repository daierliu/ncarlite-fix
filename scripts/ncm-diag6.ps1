$ErrorActionPreference = "Continue"
. "$PSScriptRoot\ncm-lib.ps1"

function Try-Get([string]$url) {
    try {
        $req = [System.Net.HttpWebRequest]::Create($url)
        $req.Method = "GET"
        $req.UserAgent = $UA
        $req.Referer = "https://music.163.com/"
        $req.Headers.Add("Cookie", "os=pc; appver=3.1.17.204416")
        $req.Timeout = 15000
        $resp = $req.GetResponse()
        $ms = New-Object System.IO.MemoryStream
        $resp.GetResponseStream().CopyTo($ms)
        $t = [Text.Encoding]::UTF8.GetString($ms.ToArray())
        if ($t.Length -gt 260) { $t = $t.Substring(0, 260) }
        return "200: $t"
    } catch [System.Net.WebException] {
        $we = $_.Exception
        if ($we.Response) {
            $ms = New-Object System.IO.MemoryStream
            $we.Response.GetResponseStream().CopyTo($ms)
            $t = [Text.Encoding]::UTF8.GetString($ms.ToArray())
            if ($t.Length -gt 260) { $t = $t.Substring(0, 260) }
            return ("HTTP " + [int]$we.Response.StatusCode + ": " + $t)
        }
        return "EX: " + $we.Message
    }
}

# 1) fresh unikey via /api
$u = Try-Get "https://music.163.com/api/login/qrcode/unikey?type=1"
Write-Output "unikey: $u"
$key = ""
try { $key = ($u.Substring(4) | ConvertFrom-Json).unikey } catch {}
Write-Output "key=$key"
Write-Output ""

if ($key) {
    Write-Output "=== POLL /api/login/qrcode/client/login (expect 801) ==="
    Try-Get ("https://music.163.com/api/login/qrcode/client/login?key=" + [Uri]::EscapeDataString($key) + "&type=1")
    Write-Output ""
}

Write-Output "=== /api/search/get s=haikuo ==="
Try-Get "https://music.163.com/api/search/get?s=%E6%B5%B7%E9%98%94%E5%A4%A9%E7%A9%BA&type=1&limit=30&offset=0&total=true"
Write-Output ""

Write-Output "=== /api/playlist/detail?id=3778678&n=10 ==="
Try-Get "https://music.163.com/api/playlist/detail?id=3778678&n=10"
Write-Output ""

Write-Output "=== /api/user/playlist?uid=1 ==="
Try-Get "https://music.163.com/api/user/playlist?uid=1&limit=60&offset=0"
Write-Output ""

Write-Output "=== /api/song/enhance/player/url?ids=[347230]&br=320000 ==="
Try-Get "https://music.163.com/api/song/enhance/player/url?ids=%5B347230%5D&br=320000"
