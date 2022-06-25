# Install and set up Terraform

## Install Terraform

[Download Terraform](https://www.terraform.io/downloads).
Unpack the file to a new directory and write it in PATH
Or unpack in C:\Windows\System32

## Set up terraform user in Microsoft Azure (Authenticate Terraform to Azure)

Install CLI. It is need to work with Azure in your PC:
[Guide Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

To connect your PC and Azure:
[Guide Get started with Azure CLI](https://docs.microsoft.com/en-us/cli/azure/get-started-with-azure-cli)
`az login`

Or you can use `Cloud Shell` in Azure
Write to connect and follow the instructions:
`Connect-AzAccount -UseDeviceAuthentication`

Your data with access you can find in:
C:\Users\user\.azure

[Azure Command-Line Interface (CLI) documentation](https://docs.microsoft.com/en-us/cli/azure/)


# Fix problem with acsess azure to github

[Creating a service principal](https://docs.microsoft.com/en-us/azure/purview/create-service-principal-azure)

To connect your PC and Azure:
[Specify service principal credentials in environment variables](https://docs.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash)

Command to create role assigment service principal:

`New-AzRoleAssignment -ObjectId <objetIDForPrincipal> -RoleDefinitionName Contributor`

Give rules to application

Writre to bash:

`export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"`

`export ARM_TENANT_ID="<azure_subscription_tenant_id>"`

`export ARM_CLIENT_ID="<service_principal_appid>"`

`export ARM_CLIENT_SECRET="<service_principal_password>"`

# Write terramorm file

[Simple example VM in terraform](https://docs.microsoft.com/ru-ru/azure/developer/terraform/create-linux-virtual-machine-with-infrastructure)

## Set up security_group

[security_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group)

## Get private ip

[data](https://registry.terraform.io/providers/hashicorp/Azurerm/latest/docs/data-sources/virtual_machine)

# EXTRA 

Connect to linux(ssh) then write command to download packages:

`wget https://nginx.org/packages/centos/7/x86_64/RPMS/nginx-1.22.0-1.el7.ngx.x86_64.rpm`

`scp /home/testadmin/nginx-1.22.0-1.el7.ngx.x86_64.rpm testadmin@10.0.2.4:/home/testadmin`

`ssh testadmin@10.0.2.4`

`sudo rpm -i nginx-1.22.0-1.el7.ngx.x86_64.rpm`

To install nginx you need download libpcre2-8.so.0()(64bit) too:

[link](https://rpmfind.net/linux/rpm2html/search.php?query=libpcre2-8.so.0()(64bit))

https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/pcre2-10.23-2.el7.x86_64.rpm

`wget https://rpmfind.net/linux/centos/7.9.2009/os/x86_64/Packages/pcre2-10.23-2.el7.x86_64.rpm`


`scp /home/testadmin/pcre2-10.23-2.el7.x86_64.rpm testadmin@10.0.2.4:/home/testadmin`

At CentOs:

`sudo rpm -i pcre2-10.23-2.el7.x86_64.rpm`

`sudo rpm -i nginx-1.22.0-1.el7.ngx.x86_64.rpm`

`sudo yum install epel-release`

`sudo yum install nginx`

Active fierwall:

[Guide](https://linuxhint.com/fix-firewalld-not-running-error-centos/)

`rpm -qa firewalld`
`/usr/lib/systemd/system | grep firewalld`

`sudo systemctl start nginx`

`sudo chown testadmin /var/www/html`

`touch /var/www/html/index.html`

`echo "Hello World" > /var/www/html/index.html`

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

`systemctl stop nginx`

`systemctl start nginx`