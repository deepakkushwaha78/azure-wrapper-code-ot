variable "location" {}
variable "resource_group_name" {}

variable "vault_name" {}
variable "vault_sku" {}

variable "vm_policy_name" {}

variable "timezone" {}
variable "backup_time" {}
variable "retention_daily_count" {}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "cross_region_restore_enabled" {
  type = bool
}

variable "soft_delete_enabled" {
  type = bool
}

variable "storage_mode_type" {
  type = string
}

variable "enable_site_recovery" {
  type = bool
}

variable "target_location" {
  type = string
}

variable "target_resource_group_name" {
  type = string
}

variable "replication_policy_name" {
  type = string
}

variable "recovery_point_retention_in_minutes" {
  type = number
}

variable "application_consistent_snapshot_frequency_in_minutes" {
  type = number
}
