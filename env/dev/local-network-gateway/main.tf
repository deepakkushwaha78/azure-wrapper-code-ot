module "local_network_gateway" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-local-network-gateway?ref=azure"

  local_network_gateway_name = local.local_network_gateway_name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  gateway_address            = var.gateway_ip_address
  address_space              = var.client_address_spaces
  bgp_settings               = var.bgp_settings

  tags = merge(local.common_tags, var.tags)
}


