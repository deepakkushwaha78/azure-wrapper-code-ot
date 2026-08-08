terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {}
  subscription_id = "e733803c-caff-4e00-9e38-875404b339e8"
}