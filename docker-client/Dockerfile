FROM microsoft/windowsservercore:1709 AS base

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ENV DESTINATION_FOLDER C:\\tools

WORKDIR /tmp

RUN $docker_url = ('https://download.docker.com/win/static/stable/x86_64/docker-17.09.0-ce.zip'); \
    (New-Object System.Net.WebClient).DownloadFile($docker_url, '/tmp/docker.zip'); \
    $install_folder = Join-Path -Path $env:DESTINATION_FOLDER -ChildPath ''; \
    Expand-Archive -Path .\docker.zip -DestinationPath $install_folder; \
    Remove-Item ('{0}\docker\dockerd.exe' -f $env:DESTINATION_FOLDER); 

FROM microsoft/powershell:6.0.2-nanoserver-1709

COPY --from=base ["tools", "tools"]

USER ContainerAdministrator
RUN setx /M PATH "%PATH%;c:\tools\docker;%ProgramFiles%\PowerShell;"

SHELL ["pwsh.exe", "-Command"]
