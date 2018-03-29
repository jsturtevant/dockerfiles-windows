$ErrorActionPreference = 'Stop';
$ProgressPreference = 'SilentlyContinue';

Write-Host "Checking for volume.."
if((Get-ChildItem C:\debuger -Force | Select-Object -First 1 | Measure-Object).Count -eq 0)
{
   echo "Empty data volume detected. Populating with debugger.."
   cp -r "C:\Program Files\Microsoft Visual Studio 15.0\Common7\IDE\Remote Debugger\x64\\*" C:\debuger
}

while ($true) {
    Write-Host "hanging out down the street"
    Start-Sleep -Seconds 1
}