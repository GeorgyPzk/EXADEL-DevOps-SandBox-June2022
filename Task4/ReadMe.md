# Docker command:

imagename == imageid 

Find some images:

`docker search <imagename>`

Download image:

`docker pull <imagename>`

Show all images in VM:

`docker images`

Show active containers:

`docker ps` `docker ps -a`

Run image:

Inside (ctrl+c to cancel):
 `docker run -it -p 80:8080 <imagename>` 

Background:
 `docker run -d -p 80:8080 <imagename>` 

Delite container:

`docker rm <imagename>`

Delite image:

`docker rmi <imagename>`

Login to container:

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

