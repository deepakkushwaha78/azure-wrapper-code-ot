module "vpn_connection" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-vpn-connection?ref=azure"

  local_network_gateway_name = local.lng_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  local_gateway_address      = var.local_gateway_address
  local_address_space        = var.local_address_space
  
  connection_name            = local.connection_name
  virtual_network_gateway_id = data.azurerm_virtual_network_gateway.vng.id
  shared_key                 = var.shared_key
  
  tags = var.tags
}
