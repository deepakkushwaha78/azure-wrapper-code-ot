module "redis" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-redis?ref=azure"

  redis_name                    = local.redis_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  capacity                      = var.capacity
  sku_name                      = var.sku_name
  family                        = var.family
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled

  # Private endpoint managed separately in private-endpoint module
  # subnet_id                                  = data.terraform_remote_state.network.outputs.aks_subnet_ids["subnet8"]
  # virtual_network_id                         = data.terraform_remote_state.network.outputs.aks_vnet_id
  # private_dns_zone_name                      = var.private_dns_zone_name
  # private_dns_zone_virtual_network_link_name = var.private_dns_zone_virtual_network_link_name

  tags = merge(local.common_tags, var.tags)
}

locals {
  # Generate name according to client requirement: <ClientCode>-Redis-<Env>-S1-1
  redis_name = "${var.client_code}-Redis-${var.environment}-S1-1"

  # Common tags as per client requirements
  common_tags = {
    Name            = "${var.client_code}-Redis-${var.environment}-S1-1"
    CC              = "${var.client_code}_${var.environment}_Redis"
    "CC-Project"    = "${var.client_code}_${var.environment}"
    "Customer-Code" = var.client_code
    Environment     = var.environment
    Project         = var.client_name
  }
}