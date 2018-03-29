# escape=`
FROM jsturtevant/4.7-windowsservercore-1709-builder:latest as build-agent
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

ARG CONFIGURATION=Release

# Build files
WORKDIR C:\src
COPY whoami-iis\packages.config .
RUN nuget restore packages.config -PackagesDirectory ..\packages

COPY . C:\src
RUN echo $env:CONFIGURATION; ` 
    msbuild whoami-iis\whoami-iis.csproj /p:OutputPath=C:\out /p:DeployOnBuild=true /p:Configuration=$env:CONFIGURATION

## final image
FROM microsoft/aspnet:4.7.1-windowsservercore-1709

WORKDIR /inetpub/wwwroot
COPY --from=build-agent C:\out\_PublishedWebsites\whoami-iis .

