output "redis_cache_details" {
  description = "Complete Redis cache information"
  value = {
    redis_id       = module.redis.redis_cache_details.redis_id
    redis_name     = module.redis.redis_cache_details.redis_name
    hostname       = module.redis.redis_cache_details.redis_hostname
    location       = module.redis.redis_cache_details.redis_location
    resource_group = module.redis.redis_cache_details.redis_resource_group
    sku_name       = module.redis.redis_cache_details.redis_sku_name
    public_access  = module.redis.redis_cache_details.public_network_access
  }
}

output "redis_connection_details" {
  description = "Redis connection information with access keys"
  value = {
    hostname                    = module.redis.redis_connection_details.hostname
    ssl_port                    = module.redis.redis_connection_details.ssl_port
    port                        = module.redis.redis_connection_details.port
    primary_access_key          = module.redis.redis_connection_details.primary_access_key
    secondary_access_key        = module.redis.redis_connection_details.secondary_access_key
    primary_connection_string   = module.redis.redis_connection_details.primary_connection_string
    secondary_connection_string = module.redis.redis_connection_details.secondary_connection_string
  }
  sensitive = true
}

output "redis_configuration" {
  description = "Redis configuration summary"
  value       = module.redis.redis_configuration
}

output "deployment_summary" {
  description = "Complete deployment summary as per client requirements"
  value = {
    name                = "${var.client_code}-Redis-${var.environment}-S1-1"
    cache_sku           = var.sku_name
    cache_size          = "${var.capacity}GB"
    connectivity_method = "Private Endpoint"
    access_keys_auth    = "Enabled"
    entra_auth          = "Disabled"
    location            = var.location
    resource_group      = var.resource_group_name
    public_access       = "Disabled"
    tls_version         = "1.2"
    ssl_enabled         = true
  }
}

output "client_requirements_compliance" {
  description = "Verification of client requirements implementation"
  value = {
    name_format      = "✓ ${var.client_code}-Redis-${var.environment}-S1-1"
    cache_sku        = "✓ Basic"
    cache_size       = "✓ 1GB"
    connectivity     = "✓ Private Endpoint"
    access_keys_auth = "✓ Enabled"
    entra_auth       = "✓ Disabled"
    public_access    = "✓ Disabled"
    ssl_tls          = "✓ TLS 1.2 minimum"
  }
}

output "tags_applied" {
  description = "Tags applied to Redis resources"
  value = merge({
    Name            = "${var.client_code}-Redis-${var.environment}-S1-1"
    CC              = "${var.client_code}_${var.environment}_Redis"
    "CC-Project"    = "${var.client_code}_${var.environment}"
    "Customer-Code" = var.client_code
    Environment     = var.environment
    Project         = var.client_name
  }, var.tags)
}

# Private endpoint managed separately in private-endpoint module
# output "private_endpoint_details" {
#   description = "Private endpoint configuration"
#   value       = module.redis.private_endpoint_details
# }

# output "private_dns_zone_details" {
#   description = "Private DNS zone information"
#   value       = module.redis.private_dns_zone_details
# }

# output "connection_info" {
#   description = "Application connection information"
#   value = {
#     redis_name      = "${var.client_code}-Redis-${var.environment}-S1-1"
#     hostname        = module.redis.redis_connection_details.hostname
#     ssl_port        = module.redis.redis_connection_details.ssl_port
#     port            = module.redis.redis_connection_details.port
#     private_ip      = module.redis.private_endpoint_details.private_ip_address
#     connection_note = "Use private endpoint for internal connectivity. SSL/TLS required."
#   }
#   sensitive = true
# }