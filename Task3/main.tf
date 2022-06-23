# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}

  subscription_id   = "${ secrets.azure_subscription_id}"
  tenant_id         = "${ secrets.azure_subscription_tenant_id}"
  client_id         = "${ secrets.service_principal_appid}"
  client_secret     = "${ secrets.service_principal_password}"
  
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
}
