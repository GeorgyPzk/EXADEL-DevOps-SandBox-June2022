# Docker command:

__Find__ some images:

`docker search <imagename>`

__Download__ image:

`docker pull <imagename>`

__Show all__ images in VM:

`docker images`

__Show active__ containers:

`docker ps` `docker ps -a`

__Run__ image:

Inside (ctrl+c to cancel):
 `docker run -it -p 80:8080 <imagename>` 

Background:
 `docker run -d -p 80:8080 <imagename>` 

__Stop__ container:

`docker rm <imagename>`

__Delite__ image:

`docker rmi <imagename>`

__Enter__ to container:

`docker exec -it <imagename> /bin/bash`

__Create__ image:

`docker build -t mycontainer:v1 .`

imagename == imageid 

[Some More](https://habr.com/ru/company/flant/blog/336654/)


# Tasks

## 1

Bash script in repository

## 2 

Main steps/command:

1. `sudo docker pull nginx`

2. `sudo docker run -d -p 80:80 nginx`

3. `sudo docker exec -it fbe895f31b03 /bin/bash`

4. Download nano or vi if you want, then edit file `/usr/share/nginx/html/index.html`

[Result](https://13.81.111.118:80)
 
## 3

1. Copy `webservice-install.sh` and `Dockerfile` to VM
2. `docker build -t mycontainer:v1 .`
3. `docker run -d -p 80:80 <imagename>` 

## 4

1. To login at DockerHub:

`docker login`

2. Create a new image of the appropriate format:

`docker tag 7d9495d03763 maryatdocker/docker-whale:latest`

3. Push to DockerHub:

`docker push georgypzk/docker-whale`

[Link to my DockerHub](https://hub.docker.com/r/georgypzk/task4)

## 5

Click `new workflow`. Then `Docker image`

## 6

docker-compose.yml
