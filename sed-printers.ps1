Get-Content .\printers.txt | Where-Object {$_ -match '\\'} | Set-Content out.txt
