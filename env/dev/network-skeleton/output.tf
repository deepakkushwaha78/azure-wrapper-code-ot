output "aks_vnet_id" {
  value = module.network_aks.vnet_id
}

output "monolithic_vnet_id" {
  value = module.network_monolithic.vnet_id
}

output "aks_subnet_ids" {
  value = module.network_aks.subnet_ids
}

output "monolithic_subnet_ids" {
  value = module.network_monolithic.subnet_ids
}

output "aks_route_table_ids" {
  value = module.network_aks.route_table_ids
}

output "monolithic_route_table_ids" {
  value = module.network_monolithic.route_table_ids
}