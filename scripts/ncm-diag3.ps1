$ErrorActionPreference = "Stop"
. "$PSScriptRoot\ncm-lib.ps1"
# Build the encrypted body for unikey type=1, dump it, and replay via curl.exe
$json = '{"type":1,"csrf_token":""}'
$w = Weapi $json
$body = "params=$($w.params)&encSecKey=$($w.encSecKey)"
$url = "https://music.163.com/weapi/login/qrcode/unikey?csrf_token="
[IO.File]::WriteAllText("C:\Temp\weapi-body.txt", $body)
Write-Output ("body len: " + $body.Length)
Write-Output ("body head: " + $body.Substring(0, 120))
$hdrs = @(
  "-H", "Content-Type: application/x-www-form-urlencoded",
  "-H", "Referer: https://music.163.com/",
  "-H", "Origin: https://music.163.com",
  "-H", "Accept-Language: zh-CN,zh;q=0.9",
  "-A", $UA,
  "-H", ("Cookie: " + (Cookie))
)
& curl.exe -s --max-time 20 -X POST $url @hdrs --data "@C:\Temp\weapi-body.txt" -o C:\Temp\weapi-resp.txt -w "curl HTTP %{http_code}`n"
Write-Output ("resp: " + [IO.File]::ReadAllText("C:\Temp\weapi-resp.txt"))
