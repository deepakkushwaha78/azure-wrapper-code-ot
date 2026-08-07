variable "clientcode" {
  description = "Customer code used in resource naming"
  type        = string
}

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the AGW subnet"
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Application Gateway"
  type        = string
  default     = "Standard_v2"
}

variable "sku_tier" {
  description = "The SKU tier of the Application Gateway"
  type        = string
  default     = "Standard_v2"
}

variable "autoscale_min_capacity" {
  description = "Minimum autoscale capacity"
  type        = number
  default     = 0
}

variable "autoscale_max_capacity" {
  description = "Maximum autoscale capacity"
  type        = number
  default     = 10
}

variable "backend_ips" {
  description = "List of backend IP addresses"
  type        = list(string)
}

variable "backend_port" {
  description = "Backend port"
  type        = number
  default     = 443
}

variable "backend_protocol" {
  description = "Backend protocol - Http or Https"
  type        = string
  default     = "Https"
}

variable "backend_request_timeout" {
  description = "Backend request timeout in seconds"
  type        = number
  default     = 320
}

variable "frontend_port" {
  description = "Frontend listener port"
  type        = number
  default     = 443
}

variable "listener_protocol" {
  description = "Listener protocol - Http or Https"
  type        = string
  default     = "Https"
}

variable "probe_path" {
  description = "Health probe path"
  type        = string
  default     = "/"
}

variable "probe_interval" {
  description = "Health probe interval in seconds"
  type        = number
  default     = 30
}

variable "probe_timeout" {
  description = "Health probe timeout in seconds"
  type        = number
  default     = 30
}

variable "probe_unhealthy_threshold" {
  description = "Health probe unhealthy threshold count"
  type        = number
  default     = 3
}

variable "probe_status_codes" {
  description = "Accepted health probe status codes"
  type        = list(string)
  default     = ["200-399"]
}

variable "ssl_certificate_password" {
  description = "Password for the PFX SSL certificate"
  type        = string
  sensitive   = true
}

variable "public_ip_allocation_method" {
  description = "Public IP allocation method"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "LRS"
}

variable "gateway_ip_configuration_name" {
  description = "Name of the gateway IP configuration"
  type        = string
  default     = "appGatewayIpConfig"
}

variable "cookie_based_affinity" {
  description = "Cookie based affinity - Enabled or Disabled"
  type        = string
  default     = "Disabled"
}

variable "pick_host_name_from_backend_address" {
  description = "Pick hostname from backend address"
  type        = bool
  default     = false
}

variable "use_public_ca" {
  description = "Use Public CA for backend HTTPS validation. Set to true for public CA, false for private CA."
  type        = bool
  default     = true
}

variable "trusted_root_certificate_data" {
  description = "Base64-encoded trusted root certificate (.crt) data for Private CA. Only required when use_public_ca is false."
  type        = string
  default     = null
}

variable "routing_rule_type" {
  description = "Routing rule type - Basic or PathBasedRouting"
  type        = string
  default     = "PathBasedRouting"
}

variable "url_path_rules" {
  description = "List of URL paths for path-based routing rule"
  type        = list(string)
  default     = ["/test/*"]
}

variable "url_path_rule_name" {
  description = "Name of the URL path rule"
  type        = string
  default     = "default-path-rule"
}

variable "routing_rule_priority" {
  description = "Routing rule priority"
  type        = number
  default     = 1
}

variable "probe_pick_host_name_from_backend" {
  description = "Pick hostname from backend HTTP settings for probe"
  type        = bool
  default     = false
}

variable "probe_host" {
  description = "Explicit hostname for health probe, used when probe_pick_host_name_from_backend is false"
  type        = string
  default     = null
}

variable "diag_metric_category" {
  description = "Diagnostic metric category"
  type        = string
  default     = "AllMetrics"
}

variable "diag_log_categories" {
  description = "Diagnostic log categories to enable"
  type        = list(string)
  default     = ["ApplicationGatewayAccessLog", "ApplicationGatewayPerformanceLog", "ApplicationGatewayFirewallLog"]
}

variable "law_retention_days" {
  description = "Log Analytics Workspace log retention in days"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags to assign to all resources"
  type        = map(string)
  default     = {}
}
