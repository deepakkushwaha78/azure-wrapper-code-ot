# Private DNS Zones — driven by tfvars
resource "azurerm_private_dns_zone" "zones" {
  for_each            = var.private_endpoints
  name                = each.value.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# VNet Links — driven by tfvars
resource "azurerm_private_dns_zone_virtual_network_link" "links" {
  for_each            = var.private_endpoints
  name                = each.value.vnet_link_name
  private_dns_zone_id = azurerm_private_dns_zone.zones[each.key].id
  virtual_network_id  = data.azurerm_virtual_network.vnet.id
  tags                = var.tags
}

# Resource ID lookup — remote state se (not in tfvars, these are infra outputs)
locals {
  resource_ids = {
    blob     = data.terraform_remote_state.blob.outputs.storage_account_id
    acr      = data.terraform_remote_state.acr.outputs.acr_id
    eventhub = data.terraform_remote_state.eventhub.outputs.namespace_id
  }
}

# Private Endpoints — fully dynamic
module "private_endpoints" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-private-endpoint?ref=azure"

  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = data.azurerm_subnet.pe_subnet.id
  tags                = var.tags

  private_endpoints = {
    for k, v in var.private_endpoints : k => {
      name                 = v.name
      resource_id          = local.resource_ids[k]
      subresource_names    = v.subresource_names
      private_dns_zone_ids = [azurerm_private_dns_zone.zones[k].id]
    }
  }
}
