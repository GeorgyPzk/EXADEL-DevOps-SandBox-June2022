# Zabbix

[Customize the installation](https://www.zabbix.com/ru/download?zabbix=6.2&os_distribution=ubuntu&os_version=20.04_focal&db=mysql&ws=nginx)



Installation for Ubuntu 20.04, nginx, MySQL
`wget https://repo.zabbix.com/zabbix/6.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.0-3+ubuntu20.04_all.deb`

`dpkg -i zabbix-release_6.0-3+ubuntu20.04_all.deb`

`apt update`

Don't forget inatall DataBase!!!!

`sudo apt install mysql-server`

`sudo mysql -uroot -p`

Write some password

`mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;`

`mysql> create user zabbix@localhost identified by 'password';`

`mysql> grant all privileges on zabbix.* to zabbix@localhost;`

`mysql> quit;`



### ERROR 1419 (HY000) at line 2119: You do not have the SUPER privilege and binary logging is enabled


# New install

`ssh -i "F:/Documents/Exadel/SshKey/Vm1_key.pem" zabbix@20.210.219.141`

`sudo apt update && sudo apt -y full-upgrade`

`sudo reboot`

mysql

`sudo apt install mysql-server`

`sudo apt update`

nginx

`sudo apt install nginx`

`sudo ufw app list`

`sudo ufw allow 'Nginx HTTP'`

`sudo ufw allow http`

`sudo ufw allow https`

`systemctl status nginx`

`sudo wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-1+ubuntu20.04_all.deb`

`sudo dpkg -i zabbix-release_6.2-1+ubuntu20.04_all.deb`

`sudo apt update`

`sudo apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent`

`sudo mysql -uroot -p`

Write password

`create database zabbix character set utf8mb4 collate utf8mb4_bin;`

`create user zabbix@localhost identified by 'zabbix';`

`grant all privileges on zabbix.* to zabbix@localhost;`
`quit`


[install zabbix](https://www.alibabacloud.com/blog/how-to-install-zabbix-monitoring-server-on-ubuntu-20-04_597802)

[]()


## FIX Failed! Error: SET PASSWORD has no significance for user 'root'@'localhost' 
Before mysql_secure_installation

`sudo mysql`

`ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'zabbix';`

`quit`

`sudo mysql_secure_installation`

all yes, only pass no


## Install Zabbix with PostgreSql

Open port 10050

[Working guide with postgeSQL](https://jtprog.ru/install-zabbix50/)

[part2](https://www.zabbix.com/ru/download?zabbix=5.0&os_distribution=ubuntu&os_version=20.04_focal&db=postgresql&ws=apache)

## Zabbix agent container

`sudo docker pull zabbix/zabbix-agent:ubuntu-5.0-latest`

`sudo docker run --name zabbix-agent -e ZBX_HOSTNAME="zabbix-host" -e ZBX_SERVER_HOST="20.108.186.149" --priveleged -d zabbix/zabbix-agent:ubuntu-5.0-latest`

## Install Zabbix agent

Open port 10050 to unlock active check . Open port 10051 to unlock active check. At zabbix server VM too!

[install agent](https://tecadmin.net/how-to-install-zabbix-agent-on-ubuntu-20-04/)
[download](https://www.zabbix.com/ru/download_agents?version=5.0+LTS&release=5.0.17&os=Linux&os_version=4.12&hardware=ppc64le&encryption=No+encryption&packaging=Archive&show_legacy=0)



