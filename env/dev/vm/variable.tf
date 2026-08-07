variable "location" {}
variable "resource_group_name" {}

variable "vms" {
  description = "Map of VM configurations. Add a new block here to create a new VM."
  type = map(object({
    size           = string
    admin_username = string
    admin_password = string
    vnet_name      = string
    subnet_name    = string
    nsg_name         = optional(string)
    create_public_ip = optional(bool, false)
    computer_name    = optional(string)
    enable_ip_forwarding = optional(bool, false) # Windows only - max 15 chars. Linux leave null.

    os_disk_storage_account_type = optional(string, "Premium_LRS")
    os_disk_size_gb              = optional(number, 128)

    data_disks = optional(map(object({
      size_gb              = number
      storage_account_type = string
      lun                  = number
    })), {})

    image_publisher = string
    image_offer     = string
    image_sku       = string
    image_version   = optional(string, "latest")
    os_type         = optional(string, "linux")

    patch_mode            = optional(string)
    patch_assessment_mode = optional(string)

    plan_name      = optional(string)
    plan_product   = optional(string)
    plan_publisher = optional(string)

    zone = optional(string)
    tags = map(string)

    public_network_access_enabled = optional(bool, false)
    network_access_policy         = optional(string, "DenyAll")
  }))
}

variable "route_tables" {
  description = "Map of route tables to add firewall routes"
  type = map(object({
    name = string
  }))
  default = {}
}

variable "firewall_vm_name" {
  description = "Name of the firewall VM to use for routing"
  type        = string
  default     = null
}

variable "firewall_route_address_prefix" {
  description = "Address prefix for firewall route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "firewall_route_name" {
  description = "Address prefix for firewall route"
  type        = string
}

