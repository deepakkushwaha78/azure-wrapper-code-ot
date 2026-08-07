output "storage_account_id" {
  description = "The ID of the file share storage account."
  value       = module.storage_file_share.storage_account_id
}

output "storage_account_name" {
  description = "The name of the file share storage account."
  value       = module.storage_file_share.storage_account_name
}

output "primary_file_endpoint" {
  description = "The primary file service endpoint."
  value       = module.storage_file_share.primary_file_endpoint
}
