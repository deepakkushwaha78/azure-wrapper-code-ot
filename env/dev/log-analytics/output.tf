output "workspace_id" {
  description = "The ID of the Log Analytics Workspace."
  value       = module.log_analytics.workspace_id
}

output "workspace_name" {
  description = "The name of the Log Analytics Workspace."
  value       = module.log_analytics.workspace_name
}
