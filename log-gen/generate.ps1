$ErrorActionPreference = 'Stop';
$ProgressPreference = 'SilentlyContinue';

[char[]]$chars = 'azertyuiopqsdfghjklmwxcvbnAZERTYUIOPQSDFGHJKLMWXCVBN0123456789-_'

#borrowed from https://www.verboon.info/2014/01/powershell-creating-dummy-files/
function generatelogs {
    1..$env:mb | ForEach-Object {
        # get 1MB of chars from 4 256KB strings
        1..4 | ForEach-Object {
            # randomize all chars and...
            $rndChars = $chars | Get-Random -Count $chars.Count
            # ...join them in a string
            $str = -join $rndChars
            # repeat random string 4096 times to get a 256KB string
            $str_ = $str * 4kb
            # write 256KB string to file
            Write-Host($str_) 
        }
    } 
}

if ($env:runforever){
    while ($true) {
        generatelogs
        Write-Host "pausing for seconds: $env:delay"
        Start-Sleep -Seconds $env:delay
    }
}else{
    generatelogs
}


