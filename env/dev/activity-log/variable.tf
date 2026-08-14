variable "diagnostic_name" {
  type = string
}

variable "storage_account_id" {
  type = list(string)
}

variable "log_categories" {
  type = list(string)
}

variable "action_group_name" {
  type = string
}

variable "action_group_short_name" {
  type = string

}

variable "email_receivers" {
  type = list(object({
    name  = string
    email = string
  }))
}

variable "alert_name" { type = string }
variable "alert_description" { type = string }

variable "alert_category" { type = string }
variable "operation_name" { type = string }

variable "resource_group_name" {
  description = "Azure resource group name for AKS"
  type        = string
}

variable "location" {
  description = "Azure region for AKS"
  type        = string
}