resource_group_name = "buildpiper"
location            = "Central India"
# prefix is deprecated - dns_prefix is auto-generated as: {client_code}-aks-{env}-dns
# prefix              = "demo"
env           = "dev"
client_code   = "BP"
client_name   = "aks"
client_id     = "bp"
client_secret = "newgen"

kubernetes_version = "1.33.6"
sku_tier           = "Standard"
# CLIENT REQUIREMENT: Enable private cluster
private_cluster_enabled = true
node_os_upgrade_channel = "None"

# CLIENT REQUIREMENT: Azure CNI with specific service CIDR
network_plugin = "azure"
network_policy = "azure"
service_cidr   = "10.0.0.0/16"
dns_service_ip = "10.0.0.10"
outbound_type  = "loadBalancer"

# CLIENT REQUIREMENT: Node pools with specific VM sizes, zones, and max pods
# NOTE: Central India only supports zones 1,2 (not 3,4)
system_node_pool = {
  name                = "systempool"
  vm_size             = "Standard_D8as_v5"
  node_count          = 1
  enable_auto_scaling = false
  min_count           = 1
  max_count           = 1
  max_pods            = 30
  availability_zones  = []
}

user_node_pool = {
  name                = "userpool"
  vm_size             = "Standard_D8as_v5"
  node_count          = 1
  enable_auto_scaling = true
  min_count           = 1
  max_count           = 2
  labels              = {}
  max_pods            = 20
  availability_zones  = []
}

observability_node_pool = {
  name               = "olly"
  vm_size            = "Standard_D8as_v5"
  node_count         = 1
  max_pods           = 40
  labels             = { team = "o11y" }
  taints             = ["team=o11y:NoSchedule"]
  availability_zones = []
}




# Application Gateway ID for ingress controller (optional)
ingress_application_gateway_id = "/subscriptions/918ba53a-0b00-48ca-b894-5584a28bf4f1/resourceGroups/buildpiper/providers/Microsoft.Network/applicationGateways/BP-AGW-DEV-S1-1"
