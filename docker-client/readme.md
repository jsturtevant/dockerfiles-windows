## Usage
from https://blog.docker.com/2017/09/docker-windows-server-1709/

```
docker run -it -v \\.\pipe\docker_engine:\\.\pipe\docker_engine -u ContainerAdministrator docker-cli
```

>note: does not work on [windows 10](https://github.com/moby/moby/issues/36562) or [1709](https://github.com/moby/moby/issues/36819) right now.

See also: https://github.com/docker/for-win/issues/1937