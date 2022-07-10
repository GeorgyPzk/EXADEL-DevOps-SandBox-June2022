# Docker command:

__Search__ some images:

`docker search <imagename>`

__Download__ image:

`docker pull <imagename>`

`docker pull georgypzk/lemp-stak-task5:v1`

__Show all__ images in VM:

`docker images`

__Show active__ containers:

`docker ps` `docker ps -a`

__Run__ image:

Inside (ctrl+c to cancel):
 `docker run -it -p 80:8080 <imagename>`

Background:
 `docker run -d -p 80:8080 <imagename>` or

 `docker run -t -d  ubuntu:latest`

__Stop__ container:

`docker rm <imagename>`

__Delite__ image:

`docker rmi <imagename>`

__Enter__ to container:

`docker exec -it <imagename> /bin/bash`

As __root__:

`docker exec -u 0 -it mycontainer bash`

__Create__ image from Dockerfile:

`docker build -t mycontainer:v1 .`

__Create__ image from __container__:

`docker commit <idcontainer> <newname>:<version>`

__Docker compose__:

Background:
`docker-compose up --build -d`

__Push__ image to __Docker hub__:

`docker login`

`docker tag <imageID> georgypzk/<imageName>:<version>`

`docker push georgypzk/<imageName>`

__SSH connection from container__:

`apt update && apt install  openssh-server sudo -y`

`chmod 600 Vm1_key.pem`

`ssh -i "Vm1_key.pem" -l azureuser 52.157.178.5 "docker ps -a"`


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

1. Copy `webservice-install.sh` and `Dockerfile` to VM. `Webservice-install.sh` and `Dockerfile` you can see in repositories.
2. To build an image from Dockerfile write:
`docker build -t mycontainer:v1 .`
`.` at the end means that the search for the dockerfile happens in the current folder.
3. To run container in background:
`docker run -d -p 80:80 <imagename>` 

Dockerfile can hand over environment variables to container. You can use this in dockerfile:

`ENV DEVOPS = "George"`

Then this variables use in ngix and displayed on the site.

## 4

1. To login at DockerHub:

`docker login`

2. Create a new image of the appropriate format:

`docker tag 7d9495d03763 maryatdocker/docker-whale:latest`

3. Push to DockerHub:

`docker push georgypzk/docker-whale`

[Link to my DockerHub](https://hub.docker.com/r/georgypzk/task4)

### 4.1

Click `new workflow`. Then `Docker image`. Don`t forget move folder with Dockerfile.

## 5

Create and fill `docker-compose.yml` file.

For run with duplicates you can use the command:

`docker-compose up scale myapp=5`

For use environment variables create `.env` file and fill value to varible.
In `docker-compose.yml` write like this:

`    environment:`

`      CATALINA_BASE: ${CATALINA_BASE_PATH}`
