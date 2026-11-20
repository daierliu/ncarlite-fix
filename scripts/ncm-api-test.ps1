# Replicates NeteaseCarLite's exact QR-login API calls (weapi) from the PC.
# Purpose: verify the server accepts the app's requests (type=3) and compare with type=1.
# Pure .NET crypto - no external deps. ASCII only (PS 5.1 reads scripts as GBK).
$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Numerics
Add-Type -AssemblyName System.IO.Compression

# --- constants copied from com.car.musiclite.Api / Crypto ---
$PRESET_KEY = "0CoJUm6Qyw8W8jud"
$IV         = "0102030405060708"
$UA         = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36 Edg/124.0.0.0"
$APPVER     = "3.1.17.204416"
$OSVER      = "Microsoft-Windows-Windows10-Professional-build-19045-64bit"
$RSA_PUB_B64 = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDgtQn2JZ34ZC28NWYpAUd98iZ37BUrX/aKzmFbt7clFSs6sXqHauqKWqdtLkF2KexO40H1YTX8z2lSgBBOAxLsvaklV8k4cBFK9snQXE9/DDaFt6Rr7iVZMldczhC0JNgTz+SHXT6CBHuX3e9SdB1Ua44oncaTWz7OBGLbCiK45wIDAQAB"

$B62 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
$rnd = New-Object System.Random

function RandStr($n) { $s = ""; for ($i=0; $i -lt $n; $i++) { $s += $B62[$rnd.Next(62)] }; $s }

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

# --- parse RSA pubkey DER (SPKI) into BigInteger n, e ---
function ParseDer([byte[]]$b, [ref]$off) {
    $type = $b[$off.Value]; $off.Value++
    $len = $b[$off.Value]; $off.Value++
    if ($len -band 0x80) {
        $nBytes = $len -band 0x7f; $len = 0
        for ($i=0; $i -lt $nBytes; $i++) { $len = ($len -shl 8) -bor $b[$off.Value]; $off.Value++ }
    }
    @{ type = $type; len = $len; start = $off.Value }
}

$der = [Convert]::FromBase64String($RSA_PUB_B64)
$o = [ref]0
$spki = ParseDer $der $o            # SEQUENCE
$alg  = ParseDer $der $o            # SEQUENCE (alg id)
$o.Value = $alg.start + $alg.len    # skip alg id
$bits = ParseDer $der $o            # BIT STRING
$o.Value = $bits.start + 1          # skip unused-bits byte
$keySeq = ParseDer $der $o          # SEQUENCE { n, e }
$nInt = ParseDer $der $o            # INTEGER modulus
$nBytes = $der[$nInt.start..($nInt.start + $nInt.len - 1)]
if ($nBytes[0] -eq 0) { $nBytes = $nBytes[1..($nBytes.Length-1)] }
[Array]::Reverse($nBytes)           # BigInteger wants little-endian
$n = New-Object System.Numerics.BigInteger(,$nBytes)
$o.Value = $nInt.start + $nInt.len      # skip modulus content before next TLV
$eInt = ParseDer $der $o
$eBytes = $der[$eInt.start..($eInt.start + $eInt.len - 1)]
if ($eBytes[0] -eq 0) { $eBytes = $eBytes[1..($eBytes.Length-1)] }
[Array]::Reverse($eBytes)
$e = New-Object System.Numerics.BigInteger(,$eBytes)
Write-Output ("RSA pubkey: modulus " + $nBytes.Length + " bytes, e=" + $e.ToString())

function RsaNoPad([byte[]]$data) {
    if ($data.Length -gt 128) { throw "rsa input too long" }
    $buf = New-Object byte[] 128
    [Array]::Copy($data, 0, $buf, 128 - $data.Length, $data.Length)
    [Array]::Reverse($buf)          # little-endian for BigInteger
    $m = New-Object System.Numerics.BigInteger(,$buf)
    $res = [System.Numerics.BigInteger]::ModPow($m, $e, $n)
    $rb = $res.ToByteArray()        # little-endian
    [Array]::Reverse($rb)           # back to big-endian
    # left-pad to 128
    $out = New-Object byte[] 128
    [Array]::Copy($rb, 0, $out, 128 - $rb.Length, $rb.Length)
    ($out | ForEach-Object { $_.ToString("x2") }) -join ""
}

function Weapi([string]$text) {
    $secret = RandStr 16
    $step1 = [Convert]::ToBase64String((AesEnc ([Text.Encoding]::UTF8.GetBytes($text)) $PRESET_KEY))
    $step2 = [Convert]::ToBase64String((AesEnc ([Text.Encoding]::UTF8.GetBytes($step1)) $secret))
    $rev = $secret.ToCharArray(); [Array]::Reverse($rev)
    $rsa = RsaNoPad ([Text.Encoding]::UTF8.GetBytes((-join $rev)))
    @{ params = [Uri]::EscapeDataString($step2); encSecKey = [Uri]::EscapeDataString($rsa) }
}

$script:nuid = ""
function RandHex($n) { $hexc = "0123456789abcdef".ToCharArray(); $s=""; for($i=0;$i -lt $n;$i++){ $s += $hexc[$rnd.Next(16)] }; $s }
$script:nuid = RandHex 64
$script:csrf = ""

function Cookie() {
    $c = "__remember_me=true; ntes_kaola_ad=1; _ntes_nuid=$nuid; _ntes_nnid=$nuid,$([DateTimeOffset]::Now.ToUnixTimeMilliseconds()); "
    $c += "WNMCID=abc123.$([DateTimeOffset]::Now.ToUnixTimeMilliseconds()).01.0; WEVNSM=1.0.0; "
    $c += "osver=$OSVER; os=pc; channel=netease; appver=$APPVER; NMTID=00O$(RandHex 38)"
    if ($csrf) { $c += "; __csrf=$csrf" }
    $c
}

function Post([string]$path, [string]$json) {
    if (-not $json.Contains("csrf_token")) {
        $json = $json.Substring(0, $json.Length-1) + ",`"csrf_token`":`"$csrf`"}"
    }
    $w = Weapi $json
    $url = "https://music.163.com/weapi$path?csrf_token=$([Uri]::EscapeDataString($csrf))"
    $body = "params=$($w.params)&encSecKey=$($w.encSecKey)"
    $req = [System.Net.HttpWebRequest]::Create($url)
    $req.Method = "POST"
    $req.ContentType = "application/x-www-form-urlencoded"
    $req.UserAgent = $UA
    $req.Referer = "https://music.163.com/"
    $req.Headers.Add("Origin", "https://music.163.com")
    $req.Accept = "*/*"
    $req.Headers.Add("Accept-Language", "zh-CN,zh;q=0.9")
    $req.Headers.Add("Cookie", (Cookie))
    $req.Timeout = 15000
    $bs = [Text.Encoding]::UTF8.GetBytes($body)
    $rs = $req.GetRequestStream()
    $rs.Write($bs, 0, $bs.Length); $rs.Close()
    $resp = $req.GetResponse()
    foreach ($h in $resp.Headers.AllKeys) {
        if ($h -ieq "Set-Cookie") {
            foreach ($v in $resp.Headers.GetValues($h)) {
                $p = $v -split ";"
                $kv = ($p[0] -split "=", 2)
                if ($kv[0].Trim() -eq "__csrf" -and $kv[1].Trim()) { $script:csrf = $kv[1].Trim() }
            }
        }
    }
    $stream = $resp.GetResponseStream()
    $ms = New-Object System.IO.MemoryStream
    $stream.CopyTo($ms)
    [Text.Encoding]::UTF8.GetString($ms.ToArray())
}

Write-Output ""
Write-Output "=== TEST 1: unikey with type=3 (what the app sends) ==="
$r1 = Post "/login/qrcode/unikey" '{"type":3}'
Write-Output $r1

$unikey3 = ($r1 | ConvertFrom-Json).unikey
if (-not $unikey3) { $unikey3 = ($r1 | ConvertFrom-Json).data.unikey }

Write-Output ""
Write-Output "=== TEST 2: client/login poll with type=3 (expect code 801) ==="
if ($unikey3) {
    $r2 = Post "/login/qrcode/client/login" ('{"key":"' + $unikey3 + '","type":3}')
    Write-Output $r2
} else { Write-Output "SKIP: no unikey" }

Write-Output ""
Write-Output "=== TEST 3: unikey with type=1 (official web value, sanity check) ==="
$r3 = Post "/login/qrcode/unikey" '{"type":1}'
Write-Output $r3

$unikey1 = ($r3 | ConvertFrom-Json).unikey
if (-not $unikey1) { $unikey1 = ($r3 | ConvertFrom-Json).data.unikey }

Write-Output ""
Write-Output "=== TEST 4: client/login poll with type=1 (expect code 801) ==="
if ($unikey1) {
    $r4 = Post "/login/qrcode/client/login" ('{"key":"' + $unikey1 + '","type":1}')
    Write-Output $r4
} else { Write-Output "SKIP: no unikey" }
