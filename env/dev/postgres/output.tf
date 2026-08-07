output "postgresql_server_details" {
  description = "Complete PostgreSQL server information"
  value       = module.postgres.postgresql_server_details
}

output "private_dns_zone_details" {
  description = "Private DNS zone configuration"
  value       = module.postgres.private_dns_zone_details
}

output "private_dns_vnet_link_details" {
  description = "DNS zone virtual network link details"
  value       = module.postgres.private_dns_vnet_link_details
}

output "connection_details" {
  description = "Database connection information"
  value       = module.postgres.connection_details
  sensitive   = true
}

output "server_configuration" {
  description = "PostgreSQL server configuration"
  value       = module.postgres.server_configuration
}

output "network_configuration" {
  description = "Network configuration used by PostgreSQL"
  value = {
    # virtual_network_name = data.terraform_remote_state.network.outputs.network_aks_vnet_details.vnet_name  # old: network_aks_vnet_details not present in remote state
    # virtual_network_name = data.terraform_remote_state.network.outputs.aks_vnet_name  # old: aks_vnet_name not yet in remote state (network-skeleton apply pending)
    virtual_network_name = var.virtual_network_name
    # virtual_network_id   = data.terraform_remote_state.network.outputs.network_aks_vnet_details.vnet_id  # old: network_aks_vnet_details not present in remote state
    virtual_network_id = data.terraform_remote_state.network.outputs.aks_vnet_id
    # subnet_id           = data.terraform_remote_state.network.outputs.network_aks_subnet_route_table_associations["subnet5"].subnet_id  # old: network_aks_subnet_route_table_associations not present in remote state
    subnet_id = data.terraform_remote_state.network.outputs.aks_subnet_ids["subnet5"]
    # route_table_id      = data.terraform_remote_state.network.outputs.network_aks_subnet_route_table_associations["subnet5"].route_table_id  # old: network_aks_subnet_route_table_associations not present in remote state
    route_table_id = data.terraform_remote_state.network.outputs.aks_route_table_ids["subnet5"]
    # vnet_address_space  = data.terraform_remote_state.network.outputs.network_aks_vnet_details.address_space  # old: network_aks_vnet_details not present in remote state
    # vnet_location       = data.terraform_remote_state.network.outputs.network_aks_vnet_details.location       # old: network_aks_vnet_details not present in remote state
    # vnet_resource_group = data.terraform_remote_state.network.outputs.network_aks_vnet_details.resource_group # old: network_aks_vnet_details not present in remote state
  }
}

output "deployment_summary" {
  description = "Complete deployment summary"
  value = {
    postgresql_server_name = module.postgres.postgresql_server_details.server_name
    postgresql_server_fqdn = module.postgres.postgresql_server_details.server_fqdn
    postgresql_version     = module.postgres.postgresql_server_details.server_version
    postgresql_sku         = module.postgres.postgresql_server_details.server_sku_name
    storage_size_gb        = module.postgres.postgresql_server_details.server_storage_mb / 1024
    backup_retention_days  = module.postgres.postgresql_server_details.server_backup_retention_days
    availability_zone      = module.postgres.postgresql_server_details.server_zone
    private_dns_zone       = module.postgres.private_dns_zone_details.dns_zone_name
    # virtual_network          = data.terraform_remote_state.network.outputs.network_aks_vnet_details.vnet_name  # old: network_aks_vnet_details not present in remote state
    # virtual_network          = data.terraform_remote_state.network.outputs.aks_vnet_name  # old: aks_vnet_name not yet in remote state (network-skeleton apply pending)
    virtual_network       = var.virtual_network_name
    subnet_used           = "subnet5 (230792_SUB5_DEV_S1_1)"
    location              = module.postgres.postgresql_server_details.server_location
    resource_group        = module.postgres.postgresql_server_details.server_resource_group
    public_access_enabled = module.postgres.postgresql_server_details.server_public_network_access
  }
}

output "tags_applied" {
  description = "Tags applied to PostgreSQL resources"
  value       = var.tags
}

output "quick_connect_info" {
  description = "Quick connection information for applications"
  value = {
    host            = module.postgres.postgresql_server_details.server_fqdn
    port            = 5432
    database        = "postgres"
    username        = module.postgres.postgresql_server_details.server_administrator_login
    ssl_mode        = "require"
    connection_note = "Use private network access only - server is not accessible from public internet"
  }
  sensitive = true
}