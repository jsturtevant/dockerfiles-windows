# escape=`
FROM microsoft/windowsservercore:1709
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -OutFile c:\rtools_setup_x64.exe -Uri https://aka.ms/vs/15/release/RemoteTools.amd64ret.enu.exe; `
    Start-Process 'c:\rtools_setup_x64.exe' -ArgumentList '/install', '/quiet', '/FallbackLoadRemoteManagedPdbs' -NoNewWindow -Wait; `
    Remove-Item c:\rtools_setup_x64.exe;

COPY Start.ps1 .

ENTRYPOINT [ "powershell", "-File", "C:\\start.ps1" ]