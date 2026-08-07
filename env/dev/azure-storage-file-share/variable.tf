variable "client_code" {
  description = "Client code for naming and tags. e.g. BP"
  type        = string
}

variable "environment" {
  description = "Environment name. e.g. DEV, PROD"
  type        = string
}

variable "client_name" {
  description = "Client/Project name for Project tag. e.g. Newgen"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name. Location is derived from it via data source."
  type        = string
}

variable "account_tier" {
  description = "Performance tier: Standard or Premium."
  type        = string
}

variable "account_replication_type" {
  description = "Redundancy: LRS for non-prod, GRS for prod."
  type        = string
}

variable "access_tier" {
  description = "Access tier: Hot or Cool."
  type        = string
}

variable "public_network_access_enabled" {
  description = "Whether public network access is enabled. Should be false."
  type        = bool
}

variable "account_kind" {
  description = "Storage account kind"
  type        = string
 
}

variable "min_tls_version" {
  description = "The minimum supported TLS version"
  type        = string

}

variable "network_rules_default_action" {
  description = "Network rules default action"
  type        = string

}

variable "network_rules_bypass" {
  description = "Network rules bypass list"
  type        = list(string)
 
}

variable "share_retention_days" {
  description = "Soft-delete retention days for file shares."
  type        = number
}

variable "file_share_config" {
  description = "File share config: quota_gb and access_tier. Name auto-generated from client_code + environment."
  type = object({
    quota_gb    = number
    access_tier = string
  })
}

variable "tags" {
  description = "Additional tags to merge with auto-generated common_tags."
  type        = map(string)
  default     = {}
}

variable "diagnostic_settings_enabled" {
  description = "Enable diagnostic settings for the storage account."
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for diagnostics."
  type        = string
  default     = null
}

# Remote state backend config
variable "tf_state_resource_group" {
  description = "Resource group of the Terraform state storage account."
  type        = string
}

variable "tf_state_storage_account" {
  description = "Storage account name holding the Terraform state."
  type        = string
}

variable "tf_state_container" {
  description = "Container name holding the Terraform state."
  type        = string
}

variable "tf_state_network_key" {
  description = "State file key for the network-skeleton state."
  type        = string
}
