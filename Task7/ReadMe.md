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

[simple ping](https://woshub-com.translate.goog/zabbix-simple-icmp-ping-checks/?_x_tr_sch=http&_x_tr_sl=en&_x_tr_tl=ru&_x_tr_hl=ru&_x_tr_pto=wapp)
[simple ping part 2](https://winitpro.ru/index.php/2020/05/07/zabbix-proverka-dostupnosti-icmp-ping/)


# Install ELK

[Guide to install ELK](https://www.digitalocean.com/community/tutorials/how-to-install-elasticsearch-logstash-and-kibana-elastic-stack-on-ubuntu-20-04-ru)

## Install java

[Guide to install Default JRE/JDK(JAVA)](https://www.digitalocean.com/community/tutorials/how-to-install-java-with-apt-on-ubuntu-20-04#installing-the-default-jrejdk)

`sudo apt update`

`java -version`

`sudo apt install default-jre -y`

`sudo apt install default-jdk -y`

`java -version`

## Install nginx

[Offical doc](https://www.elastic.co/guide/en/elastic-stack/current/installing-elastic-stack.html)

[Guide to install NGINX 5 step include](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-20-04)

`sudo apt update`

`sudo apt install nginx -y`

## Install Elasticsearch

Open port 9200 to Elasticsearch

`curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -`

`echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list`

`sudo apt update`

`sudo apt install elasticsearch`

`sudo nano /etc/elasticsearch/elasticsearch.yml`

Incomment and write: `network.host: localhost`

`sudo systemctl start elasticsearch`

`sudo systemctl enable elasticsearch`

`curl -X GET "localhost:9200"`

## Install Kibana

`sudo apt install kibana`

`sudo systemctl enable kibana`

`sudo systemctl start kibana`

User for Kibana: kibanaadmin

`echo "kibanaadmin:`openssl passwd -apr1`" | sudo tee -a /etc/nginx/htpasswd.users`

!Write user and password.

Create file `your_domain` and open 5601 port. Open port 5044 for Logstash. Copy file from repo and pase to nano.

`sudo nano /etc/nginx/sites-available/your_domain`

`sudo ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/your_domain`

`sudo nginx -t`

`sudo systemctl reload nginx`

[Configurete to finish work](https://phoenixnap.com/kb/kibana-nginx-proxy)

[Result Elastic](http://104.46.41.117:5601)

[Rusult Kibana](http://104.46.41.117:5601/status)

## Install Filebeat

[Doc Filebeat](https://www.elastic.co/guide/en/beats/filebeat/current/configuring-howto-filebeat.html)

### Restart Filebeat

`sudo systemctl start filebeat`

`sudo systemctl stop filebeat`

`sudo systemctl enable filebeat`

`sudo systemctl disable filebeat`

-----------------------------------------------

`sudo apt install filebeat`

`sudo nano /etc/filebeat/filebeat.yml`

In file write sime like a `filebeat.yml` in this dir.

`sudo filebeat modules enable system`

`sudo filebeat modules list`

`sudo filebeat setup --pipelines --modules system`

`sudo filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'`

### Problem Filebeat: "No results match your search criteria"

`sudo filebeat test output`

__Output:__ `dial up... ERROR dial tcp 127.0.0.1:5044: connect: connection refused`

__Check ststus__: `systemctl status filebeat.service`

__Check output__:`sudo filebeat test output`

__Chech IP__: `ip -brief address show`


## Install Metricbeat

`sudo apt install filebeat Metricbeat`

[Metric f](https://www.elastic.co/guide/en/beats/metricbeat/current/configuration-metricbeat.html)

If you want to see some metrics you should to rewrite `metricbeat.yml`(path:`/etc/metricbeat/metricbeat.yml`) and `<modulename>.yml`(path:`/etc/metricbeat/modules.d/<modulename>.yml`)

`sudo chown root metricbeat.yml`

Enadle modul to write:

`metricbeat modules enable nginx`

`sudo chown root modules.d/nginx.yml `

Start write metric: `sudo metricbeat -e`

[with docker](https://coralogix.com/docs/filebeat/)