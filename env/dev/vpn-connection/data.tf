data "azurerm_virtual_network_gateway" "vng" {
  name                = var.vng_name
  resource_group_name = var.resource_group_name
}
