terraform {
  backend "azurerm" {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "terraformstateng"
    container_name       = "state-file"
    key                  = "env/dev/vng/terraform.tfstate"
  }
}
