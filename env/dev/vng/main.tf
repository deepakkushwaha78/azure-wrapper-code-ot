resource "azurerm_public_ip" "vng_pip" {
  name                = var.pip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.pip_allocation_method
  sku                 = var.pip_sku
  zones               = var.pip_zones
  
  tags = var.tags
}

module "vng" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-vng?ref=azure"

  virtual_network_gateway_name = local.vng_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  sku                         = var.sku
  type                        = var.type
  vpn_type                    = var.vpn_type
  generation                  = var.generation
  active_active               = var.active_active
  bgp_enabled                 = var.bgp_enabled
  
  ip_configuration = [
    {
      name                          = var.ip_config_name
      public_ip_address_id          = azurerm_public_ip.vng_pip.id
      private_ip_address_allocation = var.private_ip_address_allocation
      subnet_id                     = data.azurerm_subnet.gateway_subnet.id
    }
  ]

  tags = var.tags
}
