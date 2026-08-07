variable "customer_code" {
  description = "Customer code for naming convention"
  type        = string
}

variable "environment" {
  description = "Environment (DEV, PROD, etc.)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location/region where the local network gateway is created"
  type        = string
}

variable "gateway_ip_address" {
  description = "The gateway IP address provided by client"
  type        = string
}

variable "client_address_spaces" {
  description = "The list of CIDR blocks for client's on-premises networks"
  type        = list(string)
}

variable "bgp_settings" {
  description = "Local Network Gateway's BGP speaker settings block"
  type = object({
    asn                 = number
    bgp_peering_address = string
    peer_weight         = optional(number)
  })
  default = null
}

variable "tags" {
  description = "Additional tags to assign to the resource"
  type        = map(string)
  default     = {}
}