output "nsg_ids" {
  description = "Map of service names to their NSG IDs"
  value       = module.nsg.nsg_ids
}

output "nsg_names" {
  description = "Map of service names to their NSG names"
  value       = module.nsg.nsg_names
}

output "flow_log_ids" {
  description = "Map of NSG Flow Log IDs"
  value       = module.nsg.flow_log_ids
}

output "nsg_details" {
  description = "Complete NSG details for all services"
  value = {
    for service_name in keys(var.services) : service_name => {
      nsg_id   = module.nsg.nsg_ids[service_name]
      nsg_name = module.nsg.nsg_names[service_name]
    }
  }
}