output "acr_id" {
  description = "The ID of the container registry"
  value       = module.acr.acr_id
}

output "acr_name" {
  description = "The name of the container registry"
  value       = module.acr.acr_name
}

output "login_server" {
  description = "The login server URL of the container registry"
  value       = module.acr.login_server
}

output "sku" {
  description = "The SKU of the container registry"
  value       = module.acr.sku
}

output "admin_enabled" {
  description = "Whether admin user is enabled (false = RBAC enforced)"
  value       = module.acr.admin_enabled
}

output "public_network_access_enabled" {
  description = "Whether public network access is enabled"
  value       = module.acr.public_network_access_enabled
}
