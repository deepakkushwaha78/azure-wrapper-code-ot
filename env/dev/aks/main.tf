module "aks" {
  source                  = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-aks?ref=azure"
  resource_group_name     = var.resource_group_name
  location                = var.location
  env                     = var.env
  client_code             = var.client_code
  client_name             = var.client_name
  node_os_upgrade_channel = var.node_os_upgrade_channel
  kubernetes_version      = var.kubernetes_version
  sku_tier                = var.sku_tier
  # auto_upgrade_channel = var.auto_upgrade_channel
  private_cluster_enabled = var.private_cluster_enabled

  # admin_username = var.admin_username
  # public_ssh_key = var.public_ssh_key
  # CHANGED: Using UserAssigned identity for custom route table support
  identity_type               = "UserAssigned"
  user_assigned_identity_name = "${var.client_code}-aks-identity-${var.env}"
  client_id                   = var.client_id
  client_secret               = var.client_secret

  network_plugin = var.network_plugin
  network_policy = var.network_policy
  service_cidr   = var.service_cidr
  dns_service_ip = var.dns_service_ip
  outbound_type  = var.outbound_type
  subnet_id      = data.terraform_remote_state.network.outputs.aks_subnet_ids["subnet7"]


  system_node_pool        = var.system_node_pool
  user_node_pool          = var.user_node_pool
  observability_node_pool = var.observability_node_pool

  ingress_application_gateway_id = var.ingress_application_gateway_id

  # CHANGED: Using ACR ID from remote state (ensure ACR is applied first)
  acr_id = data.terraform_remote_state.acr.outputs.acr_id
  tags = {
    Name          = "${var.client_code}_AKS_${var.env}-s1-1"
    CC            = "${var.client_code}_${var.env}_AKS"
    CC-Project    = "${var.client_code}_${var.env}"
    Customer-Code = var.client_code
    Environment   = var.env
    Project       = var.client_name
  }

}