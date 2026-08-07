variable "virtual_network_name" {
  description = "Name of the virtual network for PostgreSQL"
  default     = ""
}

variable "name" {
  default     = ""
  description = "Prefix of the resource name."
}

variable "postgres_zones" {
  description = "number of zone configuration for postgres."
}
variable "resource_group_name" {}

variable "subnet_address_prefixes" {
  default     = []
  description = "Location of the resource."
}

variable "db_username" {
  description = "PSQL DB USername"
  default     = ""
}

variable "db_password" {
  description = "PSQL DB Password"
  default     = ""
}

variable "name-subnet" {
  description = "subnet name"
  default     = ""
}

variable "security_rule" {
  description = "Security rule configuration"
  default = {
    name                       = "posgress-sec"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

variable "location" {
  description = "Location of the resource."
}

variable "posgressversion" {
  description = ""
  default     = 12
}

variable "storage_mb" {
  description = "storage_mb"
  default     = 131072
}

variable "sku_name" {
  description = "sku_name"
  default     = "GP_Standard_D4s_v3"
}

variable "backup_retention_days" {
  description = "backup_retention_days"
  default     = 7
}

variable "tags" {
  description = "Define resource tags"
  default = {
    owner       = "newgen"
    environemtn = "dev"
  }
}

# private dns zone 
variable "private_dns_zone_name" {
  description = "private_dns_zone_name"
}

variable "private_dns_zone_virtual_network_link_name" {
  description = "he name which should be used for this Private DNS Resolver Virtual Network Link"
}

# Maintenance window variables - client changes these in tfvars
# day_of_week: 0=Sunday, 1=Monday, 2=Tuesday ... 6=Saturday
variable "maintenance_window_day" {
  description = "Day of week for maintenance window (0=Sunday, 6=Saturday)"
  default     = 0
}

variable "maintenance_window_hour" {
  description = "Start hour (UTC) for maintenance window (0-23)"
  default     = 3
}

variable "maintenance_window_minute" {
  description = "Start minute for maintenance window (0-59)"
  default     = 0
}

variable "high_availability_enabled" {
  description = "Enable High Availability for PostgreSQL Flexible Server"
  default     = false
}

variable "geo_redundant_backup_enabled" {
  description = "Enable geo-redundant backup for DR (GRS)"
  default     = false
}

# Diagnostic settings toggle - client sets true/false in tfvars
variable "enable_diagnostic_settings" {
  description = "Enable diagnostic settings for the storage account"
  type        = bool
  default     = false
}

variable "log_analytics_workspace_id" {
  description = "Log Analytics Workspace ID for diagnostics"
  type        = string
  default     = null
}

variable "mode" {
  type    = string
}

variable "diagnostic_log_categories" {
  description = "List of log categories to enable for diagnostic settings"
  type        = list(string)
  default     = ["PostgreSQLLogs", "PostgreSQLFlexDatabaseXacts"]
}

variable "enable_audit_storage" {
  description = "Enable audit storage account"
  type        = bool
  default     = false
}

variable "audit_storage_account_name" {
  description = "Audit storage account name"
  type        = string
  default     = null
}

variable "enable_logs_storage" {
  description = "Enable logs storage account"
  type        = bool
  default     = false
}

variable "logs_storage_account_name" {
  description = "Logs storage account name"
  type        = string
  default     = null
}

variable "enable_alerts" {
  description = "Enable monitoring alerts"
  type        = bool
  default     = false
}

variable "action_group_id" {
  description = "Action Group ID for alerts"
  type        = string
  default     = null
}

variable "cpu_alert_threshold" {
  description = "CPU alert threshold"
  type        = number
  default     = 80
}

variable "memory_alert_threshold" {
  description = "Memory alert threshold"
  type        = number
  default     = 80
}

variable "storage_alert_threshold" {
  description = "Storage alert threshold"
  type        = number
  default     = 80
}