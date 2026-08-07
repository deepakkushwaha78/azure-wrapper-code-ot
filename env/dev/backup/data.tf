data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Fetch all VMs tagged Backup=True (excludes cluster nodes via tag discipline)
data "azurerm_resources" "tagged_vms" {
  resource_group_name = var.resource_group_name
  type                = "Microsoft.Compute/virtualMachines"

  required_tags = {
    Backup = "True"
  }
}
