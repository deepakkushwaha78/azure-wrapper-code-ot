variable "customer_code" {
  description = "Customer code for naming convention"
  type        = string
}

variable "environment" {
  description = "Environment (DEV, PROD, etc.)"
  type        = string
}

variable "project_name" {
  description = "Project name for tagging"
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

variable "sku" {
  description = "The SKU of the container registry"
  type        = string
  default     = "Premium"
}

variable "admin_enabled" {
  description = "Whether the admin user is enabled"
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Whether public network access is allowed"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to assign"
  type        = map(string)
  default     = {}
}

variable "georeplications" {
  description = "List of geo-replication locations. Only supported with Premium SKU."
  type = list(object({
    location                = string
    zone_redundancy_enabled = optional(bool, false)
  }))
  default = []
}
