terraform {
  backend "azurerm" {
    resource_group_name  = "buildpiper"
    storage_account_name = "terraformstatebp"
    container_name       = "state-file"
    key                  = "env/dev/private-endpoint/terraform.tfstate"
  }
}
