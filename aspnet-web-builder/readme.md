This is a temporary docker image that can be used to build asp.net applications.  The .NET Framework builder images don't include a build image for web.  In future releases they will supply an official image.

Usage:

```dockerfile
# escape=`
FROM jsturtevant/4.7-windowsservercore-1709-builder:latest as build-agent
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Build files
WORKDIR C:\src
COPY packages.config .
RUN nuget restore packages.config -PackagesDirectory ..\packages

COPY . C:\src
RUN msbuild yousite.csproj /p:OutputPath=C:\out /p:DeployOnBuild=true 

## final image
FROM microsoft/aspnet:4.7.1-windowsservercore-1709
WORKDIR /inetpub/wwwroot
COPY --from=build-agent C:\out\_PublishedWebsites\yousite .
```