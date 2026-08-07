module "dns_private_resolver" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-DNS-Resolver?ref=azure"
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  virtual_network_id  = data.terraform_remote_state.network.outputs.aks_vnet_id
  subnet_id           = data.terraform_remote_state.network.outputs.aks_subnet_ids[var.subnet_name]
  tags                = var.tags

  forwarding_rules    = var.forwarding_rules
  vnet_links          = var.vnet_links
}