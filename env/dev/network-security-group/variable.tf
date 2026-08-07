variable "resource_group_name" {
  type = string
}

variable "resource_group_location" {
  type = string
}

variable "environment" {
  type        = string
  description = "Environment (prod or non-prod)"
  validation {
    condition     = contains(["prod", "non-prod"], var.environment)
    error_message = "Environment must be either 'prod' or 'non-prod'."
  }
}

variable "env_label" {
  type        = string
  description = "Display label for environment used in tags (e.g. DEV, PROD)"
}

variable "client_code" {
  type = string
}

variable "client_name" {
  type = string
}

variable "vnet_name" {
  type        = string
  description = "Name of the VNet to look up subnets in"
}

variable "vnet_resource_group_name" {
  type        = string
  description = "Resource group where the VNet is located"
}

variable "services" {
  description = "Map of service names to their subnet names. Set skip_outbound_deny = true for AGW subnets."
  type = map(object({
    subnet_name          = string
    skip_outbound_deny   = optional(bool, false)
  }))
}

variable "default_nsg_rules" {
  description = "Default NSG rules per environment (prod/non-prod), applied to ALL services."
  type = map(map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))
}

variable "service_extra_rules" {
  description = "Per-service additional NSG rules merged on top of default rules. Key = service name."
  type = map(map(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  })))
  default = {}
}

# NSG Flow Logs Variables
variable "enable_flow_logs" {
  description = "Enable NSG Flow Logs"
  type        = bool
  default     = false
}

variable "flow_log_storage_account_id" {
  description = "Storage Account ID for NSG Flow Logs"
  type        = string
  default     = null
}

variable "flow_log_workspace_id" {
  description = "Log Analytics Workspace ID for NSG Flow Logs"
  type        = string
  default     = null
}

variable "flow_log_retention_days" {
  description = "Retention days for flow logs in storage account (30 for non-prod, 90 for prod)"
  type        = number
}

variable "flow_log_traffic_analytics_interval" {
  description = "Traffic Analytics processing interval in minutes (10 or 60)"
  type        = number
  default     = 60
}

variable "network_watcher_name" {
  description = "Name of the Network Watcher (default: NetworkWatcher_<region>)"
  type        = string
  default     = null
}

variable "network_watcher_resource_group" {
  description = "Resource group of Network Watcher (default: NetworkWatcherRG)"
  type        = string
  default     = "NetworkWatcherRG"
}
