#!/bin/bash

#install apache2
apt-get -y update
apt-get -y install apache2

# create helloworld site
echo "Hello from ${DEVOPS}!" > /var/www/html/index.html

