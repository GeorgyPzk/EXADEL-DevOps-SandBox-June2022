#!/bin/bash

#install nginx
apt-get -y update 
apt-get -y install nginx

# create helloworld site
mkdir /var/www/helloworld
cd /var/www/helloworld
echo "Hello from ${DEVOPS}!" > index.html

