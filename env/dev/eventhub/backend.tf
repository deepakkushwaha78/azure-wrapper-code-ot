terraform {
  backend "azurerm" {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "buildpiperstate"
    container_name       = "state-file"
    key                  = "env/dev/eventhub/terraform.tfstate"
  }
}
