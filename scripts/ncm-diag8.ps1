$ErrorActionPreference = "Continue"

function Try-PostJson([string]$url, [string]$json) {
    try {
        $req = [System.Net.HttpWebRequest]::Create($url)
        $req.Method = "POST"
        $req.ContentType = "application/x-www-form-urlencoded"
        $req.UserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
        $req.Referer = "https://music.163.com/"
        $req.Headers.Add("Origin", "https://music.163.com")
        $req.Headers.Add("Cookie", "os=pc; appver=3.1.17.204416")
        $req.Timeout = 15000
        $bs = [Text.Encoding]::UTF8.GetBytes($json)
        $rs = $req.GetRequestStream()
        $rs.Write($bs, 0, $bs.Length); $rs.Close()
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

Write-Output "=== POST /api/login/qrcode/unikey body={type:3} ==="
Try-PostJson "https://music.163.com/api/login/qrcode/unikey" '{"type":3}'
Write-Output ""
Write-Output "=== POST /api/song/detail body={ids:[347230]} ==="
Try-PostJson "https://music.163.com/api/song/detail" '{"ids":"[347230]"}'
Write-Output ""
Write-Output "=== POST /api/search/get body={s,song} ==="
Try-PostJson "https://music.163.com/api/search/get" '{"s":"hai kuo tian kong","type":1,"limit":5,"offset":0,"total":true}'
Write-Output ""
Write-Output "=== POST /api/v6/playlist/detail body={id,n} ==="
Try-PostJson "https://music.163.com/api/v6/playlist/detail" '{"id":3778678,"n":10,"s":8}'
Write-Output ""
Write-Output "=== POST /api/w/nuser/account/get body={} ==="
Try-PostJson "https://music.163.com/api/w/nuser/account/get" '{}'
Write-Output ""
Write-Output "=== POST /api/user/playlist body={uid} ==="
Try-PostJson "https://music.163.com/api/user/playlist" '{"uid":1,"limit":60,"offset":0,"includeVideo":true}'
Write-Output ""
Write-Output "=== POST /api/song/enhance/player/url/v1 body={ids,level} ==="
Try-PostJson "https://music.163.com/api/song/enhance/player/url/v1" '{"ids":"[347230]","level":"standard","encodeType":"mp3"}'
