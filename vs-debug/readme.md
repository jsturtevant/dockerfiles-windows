## Use
Use this as a side car to attached a debugger to another container.

## Locally

```bash
docker run -it -v C:\temp\debugger:"C:\debugger" vs-debug

#start your other container with volume and debugger port
docker run -p 8081:80 -p 4022:4022 -v C:\temp\debugger:"C:\debuger" -n debugcontainer whoami-iis:debug

# Start the debugger
docker exec -it debugcontainer c:\debuger\msvsmon.exe /nostatus /silent /noauth /anyuser /nosecuritywarn
```

Then Visual Studio you [remote debug](https://docs.microsoft.com/en-us/visualstudio/debugger/remote-debugging).

> Note: To load symbols you will need the pdb files that were generated during the build. If they are in the container you can use a volume mount `-v c:\temp\bin:c:\inetpub\wwwroot\bin` and point Visual Studio at them.  See solution 2 in the post on remote [debugging with breakpoints](http://blog.brendanlacanette.com/2016/09/remote-debugging-breakpoint-will-not.html).

## Use in Kubernetes
Coming soon...