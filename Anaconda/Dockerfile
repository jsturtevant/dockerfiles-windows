# escape=`
FROM microsoft/windowsservercore as anaconda
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ENV ANACONDA_DOWNLOAD_SHA 7d192e58915d7e7fbfd0c987ddc4db38a22d5fc47a22db71ac5873ef9ba8a503

RUN Invoke-WebRequest -UseBasicParsing https://repo.continuum.io/archive/Anaconda3-5.1.0-Windows-x86_64.exe -OutFile anaconda64.exe; `
    if ((Get-FileHash anaconda64.exe -Algorithm sha256).Hash -ne $env:ANACONDA_DOWNLOAD_SHA) { `
            Write-Host 'Anaconda checksum verification failed!'; `
            exit 1; `
    }; 

RUN Start-Process .\anaconda64.exe -ArgumentList '/S','/InstallationType=AllUsers','/AddToPath=1','/RegisterPython=1' -Wait

FROM microsoft/nanoserver

COPY --from=anaconda  C:\ProgramData\Anaconda3 C:\ProgramData\Anaconda3

RUN setx PATH "%PATH%;C:\ProgramData\Anaconda3;C:\ProgramData\Anaconda3\Library\mingw-w64\bin;C:\ProgramData\Anaconda3\Library\usr\bin;C:\ProgramData\Anaconda3\Library\bin;C:\ProgramData\Anaconda3\Scripts;"

CMD ["C:\\ProgramData\\Anaconda3\\Scripts\\anaconda.exe"]