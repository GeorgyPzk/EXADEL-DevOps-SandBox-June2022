# Docker command:

imagename == imageid 

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


# Tasks

## 1

Bash script in repository

## 2 

Main steps/command:

`sudo docker pull nginx`

`sudo docker run -d -p 80:80 nginx`

`sudo docker exec -it fbe895f31b03 /bin/bash`

Download nano or vi if you want, then edit file `/usr/share/nginx/html/index.html`

[Result](https://13.81.111.118:80)

## 3

### 3.1

