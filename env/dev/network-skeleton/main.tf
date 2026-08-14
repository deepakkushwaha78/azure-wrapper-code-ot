module "network_aks" {
  source              = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-network-skeleton?ref=azure"
  vnet_name           = var.vnet1_name
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_cidr           = var.vnet1_cidr
  subnets             = var.vnet1_subnets
  tags                = var.tags
  exclude_subnets     = var.exclude_subnets_aks
}

module "network_monolithic" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-network-skeleton?ref=azure"

  vnet_name           = var.vnet2_name
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_cidr           = var.vnet2_cidr
  subnets             = var.vnet2_subnets
  tags                = var.tags
  exclude_subnets     = var.exclude_subnets_monolithic
}
