variable "name" {}
variable "resource_group_name" {}
variable "location" {}

variable "tags" {
  type = map(string)
}

variable "forwarding_rules" {
  type = any
}

variable "subnet_name" {
  type = string
}

variable "vnet_links" {
  description = "Map of virtual network links for DNS forwarding ruleset"
  type = map(object({
    vnet_id = string
  }))
  default = {}
}