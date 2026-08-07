# -------------------------------
# Basic Cluster Info
# -------------------------------
variable "resource_group_name" {
  description = "Azure resource group name for AKS"
  type        = string
}

variable "location" {
  description = "Azure region for AKS"
  type        = string
}

variable "client_name" {
  description = "AKS client name"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
}

variable "sku_tier" {
  description = "AKS SKU tier"
  type        = string
  default     = "Standard"
}

variable "node_os_upgrade_channel" {
  description = "Node OS automatic upgrade channel"
  type        = string
}

variable "private_cluster_enabled" {
  description = "Whether the cluster should be private"
  type        = bool
  default     = false
}

variable "identity_type" {
  description = "Identity type: SystemAssigned/UserAssigned"
  type        = string
  default     = "SystemAssigned"
}

variable "user_assigned_identity_name" {
  description = "Name of user-assigned identity if used"
  type        = string
  default     = ""
}

variable "client_id" {
  description = "Client ID for SP (optional)"
  type        = string
  default     = ""
}

variable "client_secret" {
  description = "Client secret for SP (optional)"
  type        = string
  default     = ""
}

# -------------------------------
# Network
# -------------------------------
variable "network_plugin" {
  description = "Network plugin (azure/kubenet)"
  type        = string
  default     = "kubenet"
}

variable "network_policy" {
  description = "Network policy (azure/calico)"
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "Kubernetes service CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

variable "dns_service_ip" {
  description = "DNS service IP"
  type        = string
  default     = "10.0.0.10"
}

variable "outbound_type" {
  description = "Cluster outbound type (loadBalancer/userDefinedRouting)"
  type        = string
  default     = "loadBalancer"
}

# -------------------------------
# Node Pools
# -------------------------------
variable "system_node_pool" {
  description = "System node pool configuration"
  type = object({
    name                = string
    vm_size             = string
    node_count          = number
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    max_pods            = number
    availability_zones  = list(string)
  })
}

variable "user_node_pool" {
  description = "User node pool configuration"
  type = object({
    name                = string
    vm_size             = string
    node_count          = number
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    max_pods            = number
    labels              = map(string)
    availability_zones  = list(string)
  })
}

variable "observability_node_pool" {
  description = "Observability node pool configuration"
  type = object({
    name               = string
    vm_size            = string
    node_count         = number
    max_pods           = number
    labels             = map(string)
    taints             = list(string)
    availability_zones = list(string)
  })
}

variable "client_code" {
  type        = string
}

variable "env" {
  type        = string
}

variable "ingress_application_gateway_id" {
  description = "Application Gateway ID for ingress controller"
  type        = string
  default     = null
}