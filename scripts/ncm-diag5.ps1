$ErrorActionPreference = "Continue"
. "$PSScriptRoot\ncm-lib.ps1"

function Try-Get([string]$url, [string]$cookie) {
    try {
        $req = [System.Net.HttpWebRequest]::Create($url)
        $req.Method = "GET"
        $req.UserAgent = $UA
        $req.Referer = "https://music.163.com/"
        if ($cookie) { $req.Headers.Add("Cookie", $cookie) }
        $req.Timeout = 15000
        $resp = $req.GetResponse()
        $ms = New-Object System.IO.MemoryStream
        $resp.GetResponseStream().CopyTo($ms)
        $t = [Text.Encoding]::UTF8.GetString($ms.ToArray())
        if ($t.Length -gt 200) { $t = $t.Substring(0, 200) }
        return "200 OK: $t"
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

$ck = "os=pc; appver=3.1.17.204416; osver=Microsoft-Windows-10-Professional-build-19045-64bit"

Write-Output "=== /api/login/qrcode/unikey?type=1 ==="
Try-Get "https://music.163.com/api/login/qrcode/unikey?type=1" $ck
Write-Output ""
Write-Output "=== /api/login/qrcode/unikey (no param) ==="
Try-Get "https://music.163.com/api/login/qrcode/unikey" $ck
Write-Output ""
Write-Output "=== /api/w/nuser/account/get (sanity: /api POST-only? try GET) ==="
Try-Get "https://music.163.com/api/w/nuser/account/get" $ck
Write-Output ""
Write-Output "=== /api/nuser/account/get ==="
Try-Get "https://music.163.com/api/nuser/account/get" $ck
