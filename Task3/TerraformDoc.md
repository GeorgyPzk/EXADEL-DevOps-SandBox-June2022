# Install and set up Terraform

## Install Terraform

[Download Terraform](https://www.terraform.io/downloads).
Unpack the file to a new directory and write it in PATH
Or unpack in C:\Windows\System32

## Set up terraform user in Microsoft Azure (Authenticate Terraform to Azure)

?????[Guide](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-bash?tabs=bash).

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


# Fix problem 

[Creating a service principal](https://docs.microsoft.com/en-us/azure/purview/create-service-principal-azure)

To connect your PC and Azure:
[Specify service principal credentials in environment variables](https://docs.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash)


Writre to bash:
export ARM_SUBSCRIPTION_ID="<azure_subscription_id>"
export ARM_TENANT_ID="<azure_subscription_tenant_id>"
export ARM_CLIENT_ID="<service_principal_appid>"
export ARM_CLIENT_SECRET="<service_principal_password>"


