data "terraform_remote_state" "network" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "buildpiperstate"
    container_name       = "state-file"
    key                  = "env/dev/network-skeleton/terraform.tfstate"
  }
}

# Reads AGW remote state to reuse its Storage Account and Log Analytics Workspace
# for PostgreSQL diagnostic settings - avoids creating duplicate resources
data "terraform_remote_state" "agw" {
  backend = "azurerm"
  config = {
    resource_group_name  = "Buildpiper-test"
    storage_account_name = "buildpiperstate"
    container_name       = "state-file"
    key                  = "env/dev/agw/terraform.tfstate"
  }
}