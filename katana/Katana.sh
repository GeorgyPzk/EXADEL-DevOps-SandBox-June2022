


apt install git -y
apt install curl -y

apt install software-properties-common ca-certificates lsb-release apt-transport-https -y
LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php 
apt update
apt install php7.4 -y

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv composer.phar /usr/local/bin/composer
apt install php libapache2-mod-php php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql -y

cd /home
composer create-project themsaid/katana katanaexadel
cd ./katanaexadel
php katana build

chown -R $USER:$USER /home/katanaexadel/public
chown -R 755 /home/katanaexadel/public



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



/etc/nginx/mime.types
/home/katanaexadel/public

#change path in /etc/nginx/conf.d/default.conf