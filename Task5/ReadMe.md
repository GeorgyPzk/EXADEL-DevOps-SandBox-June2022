
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