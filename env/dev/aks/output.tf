# AKS Cluster Outputs
output "aks_id" {
  description = "AKS cluster resource ID"
  value       = module.aks.aks_id
}

output "aks_name" {
  description = "Name of the AKS cluster"
  value       = module.aks.aks_name
}

output "aks_fqdn" {
  description = "FQDN of the AKS cluster"
  value       = module.aks.aks_fqdn
}

output "aks_node_resource_group" {
  description = "Resource group containing AKS nodes"
  value       = module.aks.aks_node_resource_group
}

output "aks_kubernetes_version" {
  description = "Kubernetes version running on the cluster"
  value       = module.aks.aks_kubernetes_version
}

output "aks_location" {
  description = "Azure region where AKS is deployed"
  value       = module.aks.aks_location
}

# Identity Outputs
output "aks_identity_principal_id" {
  description = "Principal ID of the AKS cluster managed identity"
  value       = module.aks.aks_identity_principal_id
}

output "aks_identity_tenant_id" {
  description = "Tenant ID of the AKS cluster managed identity"
  value       = module.aks.aks_identity_tenant_id
}

output "aks_kubelet_identity" {
  description = "Kubelet identity details used by AKS nodes"
  value       = module.aks.aks_kubelet_identity
  sensitive   = true
}

output "user_assigned_identity_id" {
  description = "Resource ID of the user-assigned managed identity"
  value       = module.aks.user_assigned_identity_id
}

output "user_assigned_identity_principal_id" {
  description = "Principal ID of the user-assigned managed identity"
  value       = module.aks.user_assigned_identity_principal_id
}

output "user_assigned_identity_client_id" {
  description = "Client ID of the user-assigned managed identity"
  value       = module.aks.user_assigned_identity_client_id
}

# Network Outputs
output "aks_network_profile" {
  description = "Network configuration of the AKS cluster"
  value       = module.aks.aks_network_profile
}

# Node Pool Outputs
output "system_node_pool_id" {
  description = "System node pool identifier"
  value       = module.aks.system_node_pool_id
}

output "user_node_pool_id" {
  description = "User node pool resource ID"
  value       = module.aks.user_node_pool_id
}

output "observability_node_pool_id" {
  description = "Observability node pool resource ID"
  value       = module.aks.observability_node_pool_id
}

# Kubeconfig Outputs
output "kube_config_raw" {
  description = "Raw kubeconfig for kubectl access"
  value       = module.aks.kube_config_raw
  sensitive   = true
}

output "kube_admin_config_raw" {
  description = "Raw admin kubeconfig with elevated privileges"
  value       = module.aks.kube_admin_config_raw
  sensitive   = true
}

# Additional Information
output "aks_oidc_issuer_url" {
  description = "OIDC issuer URL for workload identity"
  value       = module.aks.aks_oidc_issuer_url
}

output "aks_portal_fqdn" {
  description = "Portal FQDN for Azure portal access"
  value       = module.aks.aks_portal_fqdn
}

output "aks_private_fqdn" {
  description = "Private FQDN for private cluster access"
  value       = module.aks.aks_private_fqdn
}

# ACR Integration
output "acr_id" {
  description = "Azure Container Registry ID integrated with AKS"
  value       = data.terraform_remote_state.acr.outputs.acr_id
}