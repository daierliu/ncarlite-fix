$ErrorActionPreference = "Stop"
. "$PSScriptRoot\ncm-lib.ps1"

function BrowserPost([string]$path, [string]$json) {
    if (-not $json.Contains("csrf_token")) {
        $json = $json.Substring(0, $json.Length-1) + ",`"csrf_token`":`"`"}"
    }
    $w = Weapi $json
    $url = "https://music.163.com/weapi$path"
    $body = "params=$($w.params)&encSecKey=$($w.encSecKey)"
    $req = [System.Net.HttpWebRequest]::Create($url)
    $req.Method = "POST"
    $req.ContentType = "application/x-www-form-urlencoded"
    $req.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/152.0.7977.167 Safari/537.36"
    $req.Referer = "https://music.163.com/"
    $req.Headers.Add("Origin", "https://music.163.com")
    $req.Accept = "*/*"
    $req.Headers.Add("Accept-Language", "zh-CN")
    $req.Headers.Add("x-os", "web")
    $req.Headers.Add("x-channelsource", "undefined")
    $req.Headers.Add("sec-ch-ua", '"Not?A_Brand";v="24", "Chromium";v="152"')
    $req.Headers.Add("sec-ch-ua-mobile", "?0")
    $req.Headers.Add("sec-ch-ua-platform", '"Windows"')
    $req.Headers.Add("sec-fetch-dest", "empty")
    $req.Headers.Add("sec-fetch-mode", "cors")
    $req.Headers.Add("sec-fetch-site", "same-origin")
    $req.Timeout = 15000
    $bs = [Text.Encoding]::UTF8.GetBytes($body)
    $rs = $req.GetRequestStream()
    $rs.Write($bs, 0, $bs.Length); $rs.Close()
    $resp = $req.GetResponse()
    $ms = New-Object System.IO.MemoryStream
    $resp.GetResponseStream().CopyTo($ms)
    [Text.Encoding]::UTF8.GetString($ms.ToArray())
}

Write-Output "=== FULL browser headers, unikey type=1 ==="
try { $r = BrowserPost "/login/qrcode/unikey" '{"type":1}'; Write-Output $r } catch { Write-Output ("EX: " + $_.Exception.Message) }
Write-Output ""
Write-Output "=== FULL browser headers, song/detail ==="
try { $r = BrowserPost "/v3/song/detail" '{"ids":"[347230]"}'; Write-Output ($r.Substring(0, [Math]::Min(200, $r.Length))) } catch { Write-Output ("EX: " + $_.Exception.Message) }
