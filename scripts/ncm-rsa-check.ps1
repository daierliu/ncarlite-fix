$ErrorActionPreference = "Stop"
. "$PSScriptRoot\ncm-lib.ps1"
$nHex = ""
$nb = $script:NCM_N.ToByteArray()   # little-endian
[Array]::Reverse($nb)              # big-endian
foreach ($b in $nb) { $nHex += $b.ToString("x2") }
Write-Output ("modulus len " + $nb.Length + " bytes")
Write-Output ("modulus: " + $nHex)
Write-Output ""
Write-Output ("e: " + $script:NCM_E.ToString())
