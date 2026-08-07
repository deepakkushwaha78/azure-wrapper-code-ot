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

variable "vng_name" {
  description = "The name of the existing Virtual Network Gateway"
  type        = string
}

variable "local_gateway_address" {
  description = "The IP address of the on-premises VPN device"
  type        = string
}

variable "local_address_space" {
  description = "The list of on-premises IP address ranges"
  type        = list(string)
}

variable "shared_key" {
  description = "The shared PKI key"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A mapping of tags to assign"
  type        = map(string)
  default     = {}
}
