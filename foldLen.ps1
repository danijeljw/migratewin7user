powershell -c "Get-ChildItem -Recurse 'C:\UserData' | Measure-Object -Property Length -Sum"
