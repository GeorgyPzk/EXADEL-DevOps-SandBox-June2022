#!/bin/bash

#install apache2
apt-get -y update
apt-get -y install apache2
sudo apt-get install mariadb-server mariadb-client
# create helloworld site
echo "Hello from George!" > /var/www/html/index.html

