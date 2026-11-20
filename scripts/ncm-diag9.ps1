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
        if ($t.Length -gt 200) { $t = $t.Substring(0, 200) }
        return "200: $t"
    } catch [System.Net.WebException] {
        $we = $_.Exception
        if ($we.Response) {
            $ms = New-Object System.IO.MemoryStream
            $we.Response.GetResponseStream().CopyTo($ms)
            $t = [Text.Encoding]::UTF8.GetString($ms.ToArray())
            if ($t.Length -gt 200) { $t = $t.Substring(0, 200) }
            return ("HTTP " + [int]$we.Response.StatusCode + ": " + $t)
        }
        return "EX: " + $we.Message
    }
}

Write-Output "=== 1. recommend/songs?limit=50&total=true (Api`$5 exact) ==="
Try-Get "https://music.163.com/api/v3/discovery/recommend/songs?limit=50&total=true"
Write-Output ""
Write-Output "=== 2. unikey type=3 then poll type=3 (Api`$8/`$9 exact) ==="
$u = Try-Get "https://music.163.com/api/login/qrcode/unikey?type=3"
Write-Output $u
$key = ""
try { $j = ($u.Substring(4) | ConvertFrom-Json); $key = $j.unikey } catch {}
if ($key) {
    Try-Get ("https://music.163.com/api/login/qrcode/client/login?key=" + [Uri]::EscapeDataString($key) + "&type=3")
} else { Write-Output "SKIP poll" }
Write-Output ""
Write-Output "=== 3. v6/playlist/detail?id=3778678&n=1000&s=8 (Api`$3 exact) ==="
Try-Get "https://music.163.com/api/v6/playlist/detail?id=3778678&n=1000&s=8"
Write-Output ""
Write-Output "=== 4. song/detail?ids=[347230,347231] (Api`$3 fallback exact) ==="
Try-Get "https://music.163.com/api/song/detail?ids=%5B347230%2C347231%5D"
Write-Output ""
Write-Output "=== 5. /api/user/playlist with MUSIC_U-less uid=0 (Api`$4 exact limit60) ==="
Try-Get "https://music.163.com/api/user/playlist?uid=0&limit=60&offset=0&includeVideo=true"
Write-Output ""
Write-Output "=== 6. /api/w/nuser/account/get with NO query at all (Api`$6 exact) ==="
Try-Get "https://music.163.com/api/w/nuser/account/get"
Write-Output ""
Write-Output "=== 7. /api/song/enhance/player/url/v1 (Api`$7 exact) ==="
Try-Get "https://music.163.com/api/song/enhance/player/url/v1?ids=%5B347230%5D&level=standard&encodeType=mp3"
Write-Output ""
Write-Output "=== 8. /api/cloudsearch/pc with quoted chars in s (esc + urlencode) ==="
Try-Get "https://music.163.com/api/cloudsearch/pc?s=%22test%22%5C&type=1&limit=30&offset=0&total=true"
