#!/bin/bash
sudo apt update
sudo apt install nginx
touch var/www/html/index.html
echo "Hello from George" > /var/www/html/index.html
echo "<<EOF
events {
    worker_connections 1024;
}

http {

    server {
        listen 80;

        location / {
            root /www/html;
        }
    }
}
EOF" > /etc/nginx/nginx.conf
systemctl stop nginx
systemctl start nginx



#echo "
#events {
#    worker_connections 1024;
#}
#
#http {
#
#    server {
#        listen 80;
#
#        location / {
#            root /www/html;
#        }
#    }
#}
#" > /etc/nginx/nginx.conf