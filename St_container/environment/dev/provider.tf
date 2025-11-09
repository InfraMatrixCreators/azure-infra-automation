terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.52.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-australia"            # RG jisme storage account bana hai
    storage_account_name = "storaustralia2025"     # Azure storage account name
    container_name       = "container-Australia"               # Blob container name
    key                  = "dev.tfstate" # State file name
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1d3588c8-af2c-442c-bdc3-7fc3b65594b9"
}