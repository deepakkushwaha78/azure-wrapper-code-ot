terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "terraformstateng"
    container_name       = "state-file"
    key                  = "env/dev/agw/terraform.tfstate"
  }
}
