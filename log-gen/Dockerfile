FROM microsoft/powershell:6.0.2-nanoserver-1709

ENV mb 1
ENV runforever false
ENV delay 1
COPY generate.ps1 .

ENTRYPOINT [ "pwsh", "-File", "C:\\generate.ps1" ]