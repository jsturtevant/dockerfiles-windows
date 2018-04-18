> Ruby does not run in a nanoserver container (see: https://github.com/StefanScherer/dockerfiles-windows/tree/master/ruby)

## Usage
docker run -v c:/logs/container/:c:/logs/ fluentd

This currently uses a built in config file that is downloaded from a gist.