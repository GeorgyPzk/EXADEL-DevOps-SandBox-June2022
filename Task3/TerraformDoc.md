# Install Terraform

[Download Terraform](https://www.terraform.io/downloads).
Unpack the file to a new directory and write it in PATH
Or unpack in C:\Windows\System32

## Set up terraform user in Microsoft Azure (Authenticate Terraform to Azure)

[Guide](https://docs.microsoft.com/en-us/azure/developer/terraform/get-started-cloud-shell-bash?tabs=bash).

[Guide Install Azure CLI on Windows](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-windows?tabs=azure-cli)

Click `Cloud Shell` in Azure 
Write to connect and follow the instructions:
`Connect-AzAccount -UseDeviceAuthentication`

# Description

## env

Specify the necessary variables. 
In `DEPLOY_VER` use `${{github.sha}}` to include SHA

`env:`
  `DEPLOY_VER: "VarWithSHA-${{github.sha}}"`
  `YEAR: "2022"`

## on 
Description of trigger mechanisms such as push or pull request and in which branch

## jobs

Describes the jobs to be done when the trigger activate

### runs-on:

The OS on which the works will be activated

### steps:

Specify the name and command to execute 

`uses: actions/checkout@v1` - used to check-out a repository so a workflow can access it

## needs: 
To start work after the first_job To  needs: [first_job] 