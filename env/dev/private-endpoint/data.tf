data "azurerm_subnet" "pe_subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "terraform_remote_state" "blob" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "buildpiperstate"
    container_name       = "state-file"
    key                  = "env/dev/azure-storage-account/terraform.tfstate"
  }
}

data "terraform_remote_state" "acr" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "buildpiperstate"
    container_name       = "state-file"
    key                  = "env/dev/acr/terraform.tfstate"
  }
}

data "terraform_remote_state" "eventhub" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "buildpiperstate"
    container_name       = "state-file"
    key                  = "env/dev/eventhub/terraform.tfstate"
  }
}
