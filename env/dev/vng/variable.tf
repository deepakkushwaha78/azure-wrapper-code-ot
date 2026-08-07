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

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "sku" {
  description = "The SKU of the Virtual Network Gateway"
  type        = string
  default     = "VpnGw1AZ"
}

variable "generation" {
  description = "The Generation of the Virtual Network Gateway"
  type        = string
  default     = "Generation1"
}

variable "active_active" {
  description = "Enable active-active mode"
  type        = bool
  default     = false
}

variable "bgp_enabled" {
  description = "Enable BGP"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Additional tags to assign"
  type        = map(string)
  default     = {}
}

variable "pip_name" {
  description = "Public IP name for VNG"
  type        = string
}

variable "pip_allocation_method" {
  description = "Public IP allocation method"
  type        = string
  default     = "Static"
}

variable "pip_sku" {
  description = "Public IP SKU"
  type        = string
  default     = "Standard"
}

variable "pip_zones" {
  description = "Availability zones for Public IP"
  type        = list(string)
  default     = ["1", "2", "3"]
}

variable "gateway_subnet_name" {
  description = "Gateway subnet name"
  type        = string
  default     = "GatewaySubnet"
}

variable "type" {
  description = "Virtual Network Gateway type"
  type        = string
  default     = "Vpn"
}

variable "vpn_type" {
  description = "VPN type"
  type        = string
  default     = "RouteBased"
}

variable "ip_config_name" {
  description = "IP configuration name"
  type        = string
  default     = "vnetGatewayConfig"
}

variable "private_ip_address_allocation" {
  description = "Private IP address allocation method"
  type        = string
  default     = "Dynamic"
}
