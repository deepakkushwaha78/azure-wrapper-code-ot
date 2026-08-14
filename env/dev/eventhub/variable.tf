variable "clientcode" {
  description = "Customer code used in resource naming"
  type        = string
}

variable "env" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed (as per request)"
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "sku" {
  description = "Pricing tier of the EventHub Namespace (Basic, Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "throughput_units" {
  description = "Throughput units for the EventHub Namespace (1-20 for Standard)"
  type        = number
  default     = 1
}

variable "local_authentication_enabled" {
  description = "Enable local authentication (SAS) for the EventHub Namespace"
  type        = bool
  default     = true
}

# ----------------------------------------
# EventHub (Kafka Topic)
# ----------------------------------------
variable "eventhub_name" {
  description = "Name of the EventHub (Kafka topic)"
  type        = string
}

variable "partition_count" {
  description = "Number of partitions for the EventHub (2-32)"
  type        = number
  default     = 2
}

variable "message_retention" {
  description = "Message retention in days (1-7 for Standard)"
  type        = number
  default     = 1
}

variable "public_access_network_enable" {
  type = bool
}
# ----------------------------------------
# EventHub Namespace
# ----------------------------------------
variable "tags" {
  description = "Tags to assign to all resources"
  type        = map(string)
  default     = {}
}
