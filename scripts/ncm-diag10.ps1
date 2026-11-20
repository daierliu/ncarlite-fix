$ErrorActionPreference = "Continue"
$UA = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0"

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
        if ($t.Length -gt 150) { $t = $t.Substring(0, 150) }
        return "200: $t"
    } catch [System.Net.WebException] {
        $we = $_.Exception
        if ($we.Response) {
            $ms = New-Object System.IO.MemoryStream
            $we.Response.GetResponseStream().CopyTo($ms)
            $t = [Text.Encoding]::UTF8.GetString($ms.ToArray())
            if ($t.Length -gt 150) { $t = $t.Substring(0, 150) }
            return ("HTTP " + [int]$we.Response.StatusCode + ": " + $t)
        }
        return "EX: " + $we.Message
    }
}

Write-Output "=== A. interface.music.163.com /api/unikey type=3 ==="
Try-Get "https://interface.music.163.com/api/login/qrcode/unikey?type=3"
Write-Output ""
Write-Output "=== B. interface3.music.163.com /api/unikey type=3 ==="
Try-Get "https://interface3.music.163.com/api/login/qrcode/unikey?type=3"
Write-Output ""
Write-Output "=== C. music.163.com again (control) ==="
Try-Get "https://music.163.com/api/login/qrcode/unikey?type=3"
