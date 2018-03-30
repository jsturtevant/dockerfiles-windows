docker build -t logger .
docker tag logger:latest jsturtevant/logger:latest
docker push jsturtevant/logger:latest
