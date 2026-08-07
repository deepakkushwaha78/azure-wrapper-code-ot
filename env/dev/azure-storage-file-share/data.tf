data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = var.tf_state_resource_group
    storage_account_name = var.tf_state_storage_account
    container_name       = var.tf_state_container
    key                  = var.tf_state_network_key
  }
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
