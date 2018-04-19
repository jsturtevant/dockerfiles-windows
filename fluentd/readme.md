> Ruby does not run in a nanoserver container (see: https://github.com/StefanScherer/dockerfiles-windows/tree/master/ruby)

## Usage
To use mount the location of the files and the configuration required to read them. There is a [default config](fluent.conf) that includes all custom configs that are dropped into `c:/fluent/config/custom`

```
docker run -v c:/logs/container/:c:/logs/ -v c:/fluent/config:c:/fluent/config/custom fluentd
```

A simple tail file config can be found at: https://gist.github.com/jsturtevant/26b3f9b9fc87cf517d37c49759295eb6
