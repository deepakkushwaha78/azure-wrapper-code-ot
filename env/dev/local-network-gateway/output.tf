output "local_network_gateway_details" {
  description = "Complete Local Network Gateway details"
  value = {
    gateway_id          = module.local_network_gateway.local_network_gateway_id
    gateway_name        = "${var.customer_code}-LNG-${var.environment}-S1-1"
    resource_group_name = var.resource_group_name
    location            = var.location
    gateway_ip_address  = var.gateway_ip_address
    address_spaces      = var.client_address_spaces
  }
}

output "local_network_gateway_id" {
  description = "The ID of the local network gateway"
  value       = module.local_network_gateway.local_network_gateway_id
}

output "local_network_gateway_name" {
  description = "The name of the local network gateway"
  value       = "${var.customer_code}-LNG-${var.environment}-S1-1"
}

output "gateway_configuration" {
  description = "Gateway configuration summary"
  value = {
    name            = "${var.customer_code}-LNG-${var.environment}-S1-1"
    endpoint_type   = "IP address"
    gateway_ip      = var.gateway_ip_address
    client_networks = var.client_address_spaces
    bgp_enabled     = var.bgp_settings != null ? true : false
    location        = var.location
    resource_group  = var.resource_group_name
  }
}

output "connection_info" {
  description = "Information for VPN connection setup"
  value = {
    local_gateway_id   = module.local_network_gateway.local_network_gateway_id
    local_gateway_name = "${var.customer_code}-LNG-${var.environment}-S1-1"
    remote_gateway_ip  = var.gateway_ip_address
    remote_networks    = var.client_address_spaces
    next_steps         = "Create Virtual Network Gateway and VPN Connection to establish site-to-site connectivity"
  }
}

output "tags_applied" {
  description = "Tags applied to the local network gateway"
  value = merge({
    Name            = "${var.customer_code}-LNG-${var.environment}-S1-1"
    CC              = "${var.customer_code}_${var.environment}_LNG"
    "CC-Project"    = "${var.customer_code}_${var.environment}"
    "Customer-Code" = var.customer_code
    Environment     = var.environment
    Project         = "ClientProject"
  }, var.tags)
}