variable "client_code" {
  description = "Client code for naming convention"
  type        = string
}

variable "environment" {
  description = "Environment (DEV, PROD, etc.)"
  type        = string
}

variable "client_name" {
  description = "Client name for Project tag"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the Redis cache is created"
  type        = string
}

variable "capacity" {
  description = "The size of the Redis cache (1GB = 1)"
  type        = number
  default     = 1
}

variable "sku_name" {
  description = "The SKU of Redis (Basic as per requirement)"
  type        = string
  default     = "Basic"
}


variable "tags" {
  description = "Additional tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "family" {
  description = "A map of tags to assign to the resource"
  type        = string
}

variable "minimum_tls_version" {
  description = "A map of tags to assign to the resource"
  type        = string
}

variable "public_network_access_enabled" {
  description = "A map of tags to assign to the resource"
  type        = bool
}