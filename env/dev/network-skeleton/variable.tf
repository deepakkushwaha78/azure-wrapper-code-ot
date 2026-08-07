variable "vnet1_name" {
  type        = string
  description = "Name of AKS VNet"
}

variable "vnet1_cidr" {
  type        = string
  description = "CIDR range for AKS VNet"
}

variable "vnet2_name" {
  type        = string
  description = "Name of Monolithic VNet"
}

variable "vnet2_cidr" {
  type        = string
  description = "CIDR range for Monolithic VNet"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "vnet1_subnets" {
  description = "Subnets for AKS VNet"
  type = map(object({
    name       = string
    cidr       = string
    rt_name    = optional(string)
    delegation = optional(string)
  }))
}

variable "vnet2_subnets" {
  description = "Subnets for Monolithic VNet"
  type = map(object({
    name       = string
    cidr       = string
    rt_name    = optional(string)
    delegation = optional(string)
  }))
}

variable "tags" {
  type        = map(string)
  description = "Common tags applied to resources"
}

variable "exclude_subnets_aks" {
  description = "Subnets to exclude from route table association in AKS VNet"
  type        = list(string)
  default     = []
}

variable "exclude_subnets_monolithic" {
  description = "Subnets to exclude from route table association in Monolithic VNet"
  type        = list(string)
  default     = []
}