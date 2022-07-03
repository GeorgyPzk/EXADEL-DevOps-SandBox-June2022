
# Task 5

## 1 

1. Create 3 VM in azure
2. Connect via ssh to your first VM

`ssh -i "F:/Documents/Exadel/SshKey/Vm1_key.pem" azureuser@20.125.130.232`

3. Python needed to install ansible, but Ubuntu and CentOS have Python in defoult. 
4. List command to install ansible:

`sudo apt-add-repository ppa:ansible/ansible`

`sudo apt-get update`

`sudo apt-get install ansible`

## 2

To connect ansible from Vm1 to Vm2 and Vm3:
1. Copy SSH keys for Vm2 and Vm3 to Vm1.
2. Write hosts.txt with connet to VM in separate directory. Like this:
`<AnyName> ansible_host=20.231.17.90 ansible_user=azureuser ansible_ssh_private_key_file=/home/Admin123/.ssh/Task5VM1_key.pem`
3. Test __ping-pong__: 
`ansible -i hosts.txt all-m ping`. Output in `OutPingPong.txt`

4. (Optional) Write ansible.cfg to reduse command. Check `ansible.cfg` in repository. To check path to config file write `ansible --version`

## 3

1. Write playbook.yml 
2. `ansible-playbook playbook.yml`
3. [To write playbook for install docker use this](https://tutorials.releaseworksacademy.com/learn/installing-docker-on-ubuntu-with-ansible)
4. Result check in `OutPutDocker.txt`

## Extra

Run container with LEMP stak.
At first create image with LEMP stak and push it to DokerHub. Then you need only to run this image after install docker.
On vm1:

`sudo docker pull mysql`

`sudo docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=<secret> -d mysql`

`sudo docker exec -it 06e14ec275e3 /bin/bash`

To fix error with python an ansible:
`sudo apt install python3-docker`

`sudo apt install python3-pip`

`pip install docker==4.4.4`

In container:

`apt-get update`

`apt-get install systemd`

`cat /etc/os-release`

`mysql --version` to chek

`mysql_secure_installation` enter password and 

`apt-get install nginx`

`apt-get install php`

Check all insallation in `/Task5/images/LAMP container.png`

on vm1:

`sudo docker commit 06e14ec275e3 lemp_image:v1`

`docker login`

`docker tag <imageID> georgypzk/lemp-stak-task5:v1`

`docker push georgypzk/lemp-stak-task5:v1`

Run playbook:

`sudo ansible-playbook playbook.yml`

Output can find in `OutPutDockerEXTRA.txt`