#!/bin/bash
sudo apt update -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt install docker-ce -y
sudo usermod -aG docker $USER
sudo apt-get install docker-compose-plugin
sudo docker compose version

#wget https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-linux-x86_64
#sudo mv docker-compose-linux-x86_64 /usr/bin/docker-compose
#sudo chmod +X /usr/bin/docker-compose