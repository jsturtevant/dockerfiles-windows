# escape=`
FROM microsoft/windowsservercore:1709 AS base
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /fluentd

RUN Invoke-WebRequest -UseBasicParsing -Uri http://packages.treasuredata.com.s3.amazonaws.com/3/windows/td-agent-3.1.1-0-x64.msi -out tdagent.msi
RUN Start-Process msiexec.exe -ArgumentList '-i', 'tdagent.msi', '/quiet', '/passive' -NoNewWindow -Wait;

FROM microsoft/windowsservercore:1709
COPY --from=base ["C:\\opt\\td-agent", "C:\\opt\\td-agent"]
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN Invoke-WebRequest -UseBasicParsing -Uri https://gist.githubusercontent.com/jsturtevant/26b3f9b9fc87cf517d37c49759295eb6/raw/5c4fe3f0d33f22d62906a8b4def982116493ccee/tailfile.conf -OutFile C:/opt/td-agent/etc/td-agent/tdagent.conf

ENTRYPOINT ["cmd", "/k", "C:\\opt\\td-agent\\embedded\\bin\\fluentd", "-c", "C:\\opt\\td-agent\\etc\\td-agent\\tdagent.conf"]