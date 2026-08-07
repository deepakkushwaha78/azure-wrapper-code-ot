output "vm_ids" {
  description = "Map of VM IDs"
  value       = { for k, v in module.virtual_machine : k => v.vm_id }
}

output "nic_ids" {
  description = "Map of NIC IDs"
  value       = { for k, v in module.virtual_machine : k => v.nic_id }
}

output "private_ips" {
  description = "Map of private IP addresses"
  value       = { for k, v in module.virtual_machine : k => v.private_ip }
}

output "public_ip_ids" {
  description = "Map of public IP IDs"
  value       = { for k, v in module.virtual_machine : k => v.public_ip_id }
}

output "firewall_routes" {
  description = "Firewall routes attached to route tables"
  value = var.firewall_vm_name != null ? module.virtual_machine[var.firewall_vm_name].firewall_routes : {}
}

