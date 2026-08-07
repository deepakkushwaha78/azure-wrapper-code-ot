variable "storage_account_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "access_tier" {
  type    = string
  default = "Hot"
}

variable "public_network_access_enabled" {
  type    = bool
  default = false
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

variable "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled"
  type        = bool
}

variable "blob_versioning_enabled" {
  type    = bool
  default = true
}

variable "containers" {
  type = map(object({
    container_access_type = string
  }))
  default = {
    "data" = {
      container_access_type = "private"
    }
  }
}

variable "allowed_ip_ranges" {
  type    = list(string)
  default = []
}

variable "allowed_subnet_ids" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "diagnostic_settings_enabled" {
  description = "Enable diagnostic settings for the storage account"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for diagnostics"
  type        = string
  default     = null
}

variable "log_retention_days" {
  description = "Number of days to retain logs in storage account for archival"
  type        = number
  default     = 365
}

variable "archive_storage_account_id" {
  description = "Storage account ID for archiving diagnostic logs (for audit purposes)"
  type        = string
  default     = null
}
