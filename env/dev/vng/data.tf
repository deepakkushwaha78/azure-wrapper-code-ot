data "azurerm_subnet" "gateway_subnet" {
  name                 = var.gateway_subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.resource_group_name
}
