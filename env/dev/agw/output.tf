output "agw_id" {
  value = module.agw.agw_id
}

output "agw_name" {
  value = module.agw.agw_name
}

output "public_ip_address" {
  value = module.agw.public_ip_address
}

output "diag_storage_account_id" {
  value = module.agw.diag_storage_account_id
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.law.id
}
