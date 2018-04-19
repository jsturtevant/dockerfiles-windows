# escape=`
FROM microsoft/windowsservercore:1709 AS base
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

WORKDIR /fluentd

RUN Invoke-WebRequest -UseBasicParsing -Uri http://packages.treasuredata.com.s3.amazonaws.com/3/windows/td-agent-3.1.1-0-x64.msi -out tdagent.msi; `
    Start-Process msiexec.exe -ArgumentList '-i', 'tdagent.msi', '/quiet', '/passive' -NoNewWindow -Wait; `
    Remove-Item tdagent.msi;

FROM microsoft/windowsservercore:1709
COPY --from=base ["C:\\opt\\td-agent", "C:\\opt\\td-agent"]

COPY fluent.conf /fluent/conf/fluent.conf

ENTRYPOINT ["cmd", "/k", "C:\\opt\\td-agent\\embedded\\bin\\fluentd", "-c", "C:\\fluent\\conf\\fluent.conf"]