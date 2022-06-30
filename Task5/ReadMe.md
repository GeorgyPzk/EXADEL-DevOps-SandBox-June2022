
# Task 5

## 1 

1. Create 3 VM in azure
2. Connect via ssash to your first VM

`ssh -i "F:/Documents/Exadel/SshKey/Vm1_key.pem" azureuser@20.125.130.232`

3. Pythin needed to install ansible, but Ubuntu and CentOS have Python in defoult. 
4. List command to install ansible:

`sudo apt-add-repository ppa:ansible/ansible`

`sudo apt-get update`

`sudo apt-get install ansible`

## 2

To connect ansible from Vm1 to Vm2 and Vm3:
1. Copy SSH keys for Vm2 and Vm3 to Vm1.
2. Write hosts.txt with connet to VM in separate directory. Like this:
`<AnyName> ansible_host=20.231.17.90 ansible_user=azureuser ansible_ssh_private_key_file=/home/Admin123/.ssh/Task5VM1_key.pem`
3. `ansible -i hosts.txt all-m ping`