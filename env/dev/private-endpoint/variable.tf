variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "private_endpoints" {
  description = "Map of private endpoints — client manages this via tfvars"
  type = map(object({
    name              = string
    subresource_names = list(string)
    dns_zone_name     = string
    vnet_link_name    = string
  }))
}
