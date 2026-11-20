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
        if ($t.Length -gt 240) { $t = $t.Substring(0, 240) }
        return "200: $t"
    } catch [System.Net.WebException] {
        $we = $_.Exception
        if ($we.Response) {
            $ms = New-Object System.IO.MemoryStream
            $we.Response.GetResponseStream().CopyTo($ms)
            $t = [Text.Encoding]::UTF8.GetString($ms.ToArray())
            if ($t.Length -gt 240) { $t = $t.Substring(0, 240) }
            return ("HTTP " + [int]$we.Response.StatusCode + ": " + $t)
        }
        return "EX: " + $we.Message
    }
}

Write-Output "=== A. /api unikey type=3 (app's value) ==="
Try-Get "https://music.163.com/api/login/qrcode/unikey?type=3"
Write-Output ""
Write-Output "=== B. /api song/enhance/player/url/v1 ==="
Try-Get "https://music.163.com/api/song/enhance/player/url/v1?ids=%5B347230%5D&level=standard&encodeType=mp3"
Write-Output ""
Write-Output "=== C. /api/v3/discovery/recommend/songs (anon) ==="
Try-Get "https://music.163.com/api/v3/discovery/recommend/songs"
Write-Output ""
Write-Output "=== D. /api/cloudsearch/pc (app's first search choice) ==="
Try-Get "https://music.163.com/api/cloudsearch/pc?s=%E6%B5%B7%E9%98%94%E5%A4%A9%E7%A9%BA&type=1&limit=30&offset=0&total=true"
Write-Output ""
Write-Output "=== E. /api/v6/playlist/detail ==="
Try-Get "https://music.163.com/api/v6/playlist/detail?id=3778678&n=10"
Write-Output ""
Write-Output "=== F. /api/user/playlist with includeVideo param ==="
Try-Get "https://music.163.com/api/user/playlist?uid=1&limit=60&offset=0&includeVideo=true"
Write-Output ""
Write-Output "=== G. /api/w/nuser/account/get (app's exact path) ==="
Try-Get "https://music.163.com/api/w/nuser/account/get"
