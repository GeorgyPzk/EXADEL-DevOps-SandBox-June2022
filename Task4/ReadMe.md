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

imagename == imageid 


# Tasks

Сreated VM:

![VM!](/home/runner/work/EXADEL-DevOps-SandBox-June2022/EXADEL-DevOps-SandBox-June2022/Task4/images/1.jpg "San Juan Mountains")

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

### 3.1



### 3.2

