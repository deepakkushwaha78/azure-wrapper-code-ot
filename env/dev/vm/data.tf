data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.vms
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_network_security_group" "nsg" {
  for_each            = { for k, v in var.vms : k => v if v.nsg_name != null }
  name                = each.value.nsg_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.vms : k => v if v.create_public_ip == true }
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = each.value.tags
}
