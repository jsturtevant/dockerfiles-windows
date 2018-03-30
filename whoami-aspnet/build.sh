docker build -t whoami-aspnet:debug --build-arg CONFIGURATION=Debug .
docker tag whoami-iis:debug jsturtevant/whoami-aspnet:debug
docker push jsturtevant/whoami-aspnet:debug

docker build -t whoami-aspnet .
docker tag whoami-iis:latest jsturtevant/whoami-aspnet:latest
docker push jsturtevant/whoami-aspnet:latest
