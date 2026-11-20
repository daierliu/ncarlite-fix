# Shared weapi crypto + HTTP for NCM API tests. ASCII only.
# Source of truth: com.car.musiclite Crypto.java / Api.java (NeteaseCarLite-v1.0.0)
Add-Type -AssemblyName System.Numerics
Add-Type -AssemblyName System.IO.Compression
[System.Net.ServicePointManager]::Expect100Continue = $false
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

$PRESET_KEY = "0CoJUm6Qyw8W8jud"
$IV         = "0102030405060708"
$UA         = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0"
$APPVER     = "3.1.17.204416"
$OSVER      = "Microsoft-Windows-Windows10-Professional-build-19045-64bit"
$RSA_PUB_B64 = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgtQn2JZ34ZC28NWYpAUd98iZ37BUrX/aKzmFbt7clFSs6sXqHauqKWqdtLkF2KexO40H1YTX8z2lSgBBOAxLsvaklV8k4cBFK9snQXE9/DDaFt6Rr7iVZMldczhC0JNgTz+SHXT6CBHuX3e9SdB1Ua44oncaTWz7OBGLbCiK45wIDAQAB"

$B62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
$HEXC = "0123456789abcdef".ToCharArray()
$rnd = New-Object System.Random
$script:NUID = ""
$script:CSRF = ""
for ($i=0; $i -lt 64; $i++) { $script:NUID += $HEXC[$rnd.Next(16)] }

function ParseDer([byte[]]$b, [ref]$off) {
    $type = $b[$off.Value]; $off.Value++
    $len = $b[$off.Value]; $off.Value++
    if ($len -band 0x80) {
        $nBytes = $len -band 0x7f; $len = 0
        for ($i=0; $i -lt $nBytes; $i++) { $len = ($len -shl 8) -bor $b[$off.Value]; $off.Value++ }
    }
    @{ type = $type; len = $len; start = $off.Value }
}

function Init-Rsa {
    $der = [Convert]::FromBase64String($RSA_PUB_B64)
    $o = [ref]0
    ParseDer $der $o | Out-Null
    $alg = ParseDer $der $o
    $o.Value = $alg.start + $alg.len
    $bits = ParseDer $der $o
    $o.Value = $bits.start + 1
    ParseDer $der $o | Out-Null
    $nInt = ParseDer $der $o
    $nBytes = $der[$nInt.start..($nInt.start + $nInt.len - 1)]
    if ($nBytes[0] -eq 0) { $nBytes = $nBytes[1..($nBytes.Length-1)] }
    [Array]::Reverse($nBytes)
    $script:NCM_N = New-Object System.Numerics.BigInteger(,$nBytes)
    $o.Value = $nInt.start + $nInt.len
    $eInt = ParseDer $der $o
    $eBytes = $der[$eInt.start..($eInt.start + $eInt.len - 1)]
    if ($eBytes[0] -eq 0) { $eBytes = $eBytes[1..($eBytes.Length-1)] }
    [Array]::Reverse($eBytes)
    $script:NCM_E = New-Object System.Numerics.BigInteger(,$eBytes)
}
Init-Rsa

function RandStr($n, $charset) { $s=""; for($i=0;$i -lt $n;$i++){ $s += $charset[$rnd.Next($charset.Length)] }; $s }

function AesEnc([byte[]]$data, [string]$key) {
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Mode = [System.Security.Cryptography.CipherMode]::CBC
    $aes.Padding = [System.Security.Cryptography.PaddingMode]::PKCS7
    $aes.KeySize = 128
    $aes.Key = [Text.Encoding]::UTF8.GetBytes($key)
    $aes.IV  = [Text.Encoding]::UTF8.GetBytes($IV)
    $enc = $aes.CreateEncryptor()
    $out = $enc.TransformFinalBlock($data, 0, $data.Length)
    $enc.Dispose(); $aes.Dispose()
    $out
}

function RsaNoPad([byte[]]$data) {
    if ($data.Length -gt 128) { throw "rsa input too long" }
    $buf = New-Object byte[] 128
    [Array]::Copy($data, 0, $buf, 128 - $data.Length, $data.Length)
    [Array]::Reverse($buf)
    $m = New-Object System.Numerics.BigInteger(,$buf)
    $res = [System.Numerics.BigInteger]::ModPow($m, $script:NCM_E, $script:NCM_N)
    $rb = $res.ToByteArray()
    [Array]::Reverse($rb)
    $out = New-Object byte[] 128
    [Array]::Copy($rb, 0, $out, 128 - $rb.Length, $rb.Length)
    ($out | ForEach-Object { $_.ToString("x2") }) -join ""
}

function Weapi([string]$text) {
    $secret = RandStr 16 $B62
    $step1 = [Convert]::ToBase64String((AesEnc ([Text.Encoding]::UTF8.GetBytes($text)) $PRESET_KEY))
    $step2 = [Convert]::ToBase64String((AesEnc ([Text.Encoding]::UTF8.GetBytes($step1)) $secret))
    $rev = $secret.ToCharArray(); [Array]::Reverse($rev)
    $rsa = RsaNoPad ([Text.Encoding]::UTF8.GetBytes((-join $rev)))
    @{ params = [Uri]::EscapeDataString($step2); encSecKey = [Uri]::EscapeDataString($rsa) }
}

function Cookie() {
    $c = "__remember_me=true; ntes_kaola_ad=1; _ntes_nuid=$script:NUID; _ntes_nnid=$script:NUID,$([DateTimeOffset]::Now.ToUnixTimeMilliseconds()); "
    $c += "WNMCID=abc.$([DateTimeOffset]::Now.ToUnixTimeMilliseconds()).01.0; WEVNSM=1.0.0; "
    $c += "osver=$OSVER; os=pc; channel=netease; appver=$APPVER; NMTID=00O$(RandStr 38 $HEXC)"
    if ($script:CSRF) { $c += "; __csrf=$script:CSRF" }
    $c
}

# POST a weapi request; returns raw body string. Updates CSRF from Set-Cookie.
function Post([string]$path, [string]$json) {
    if (-not $json.Contains("csrf_token")) {
        $json = $json.Substring(0, $json.Length-1) + ",`"csrf_token`":`"$script:CSRF`"}"
    }
    $w = Weapi $json
    $url = "https://music.163.com/weapi$path"
    $body = "params=$($w.params)&encSecKey=$($w.encSecKey)"
    $req = [System.Net.HttpWebRequest]::Create($url)
    $req.Method = "POST"
    $req.ContentType = "application/x-www-form-urlencoded"
    $req.UserAgent = $UA
    $req.Referer = "https://music.163.com/"
    $req.Headers.Add("Origin", "https://music.163.com")
    $req.Accept = "*/*"
    $req.Headers.Add("Accept-Language", "zh-CN")
    $req.Headers.Add("x-os", "web")
    $req.Headers.Add("x-channelsource", "undefined")
    $req.Headers.Add("Cookie", (Cookie))
    $req.Timeout = 15000
    $bs = [Text.Encoding]::UTF8.GetBytes($body)
    $rs = $req.GetRequestStream()
    $rs.Write($bs, 0, $bs.Length); $rs.Close()
    $resp = $req.GetResponse()
    foreach ($h in $resp.Headers.AllKeys) {
        if ($h -ieq "Set-Cookie") {
            foreach ($v in $resp.Headers.GetValues($h)) {
                $kv = ($v -split ";")[0] -split "=", 2
                if ($kv[0].Trim() -eq "__csrf" -and $kv[1].Trim()) { $script:CSRF = $kv[1].Trim() }
            }
        }
    }
    $stream = $resp.GetResponseStream()
    $ms = New-Object System.IO.MemoryStream
    $stream.CopyTo($ms)
    [Text.Encoding]::UTF8.GetString($ms.ToArray())
}

# GET music.163.com homepage, extract __csrf cookie (mirrors the real web flow)
function Get-Csrf {
    $req = [System.Net.HttpWebRequest]::Create("https://music.163.com/")
    $req.Method = "GET"
    $req.UserAgent = $UA
    $req.Headers.Add("Cookie", (Cookie))
    $req.Timeout = 15000
    $resp = $req.GetResponse()
    foreach ($h in $resp.Headers.AllKeys) {
        if ($h -ieq "Set-Cookie") {
            foreach ($v in $resp.Headers.GetValues($h)) {
                $kv = ($v -split ";")[0] -split "=", 2
                if ($kv[0].Trim() -eq "__csrf" -and $kv[1].Trim()) { $script:CSRF = $kv[1].Trim() }
            }
        }
    }
    $resp.Close()
    return $script:CSRF
}
