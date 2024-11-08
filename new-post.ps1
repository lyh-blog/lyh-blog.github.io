$t = Get-Date -Format "yyyyMMddHHmmss"
$name = $t + ".md"
$c = "hugo new posts/" + $name
Invoke-Expression $c
