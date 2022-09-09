apt-get update && apt-get upgrade -y
apt-get install vim nano -y
apt install git -y
apt install curl -y
apt install net-tools -y

apt install nginx -y

apt install redis-server -y

apt install php libapache2-mod-php php-mbstring php-cli php-bcmath php-json php-xml php-zip php-pdo php-common php-tokenizer php-mysql -y
apt-get install php-curl

apt update
apt install curl php-cli php-mbstring git unzip -y
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer


cd ./home/airflix
composer update


php artisan airflix:install