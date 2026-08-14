# Random suffix for storage account name uniqueness
resource "random_id" "diag_suffix" {
  byte_length = 4
}

# Log Analytics Workspace for AGW diagnostics
resource "azurerm_log_analytics_workspace" "law" {
  name                = "${lower(var.clientcode)}-agw-law-${var.env}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = var.law_retention_days

  tags = var.tags
}

locals {
  agw_name          = "${upper(var.clientcode)}-AGW-${upper(var.env)}-S1-1"
  pip_name          = "${local.agw_name}-pip"
  diag_storage_name = lower(substr("${var.clientcode}${var.env}agwdiag${random_id.diag_suffix.hex}", 0, 24))

  agw_tags = merge(var.tags, {
    Name = local.agw_name
  })
}

module "agw" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-agw?ref=azure"

  resource_group_name        = var.resource_group_name
  location                   = var.location
  agw_name                   = local.agw_name
  public_ip_name             = local.pip_name
  subnet_id                  = data.azurerm_subnet.agw_subnet.id
  sku_name                   = var.sku_name
  sku_tier                   = var.sku_tier
  autoscale_min_capacity     = var.autoscale_min_capacity
  autoscale_max_capacity     = var.autoscale_max_capacity
  backend_ips                = var.backend_ips
  backend_port               = var.backend_port
  backend_protocol           = var.backend_protocol
  backend_request_timeout    = var.backend_request_timeout
  frontend_port              = var.frontend_port
  listener_protocol          = var.listener_protocol
  probe_path                 = var.probe_path
  probe_interval             = var.probe_interval
  probe_timeout              = var.probe_timeout
  probe_unhealthy_threshold  = var.probe_unhealthy_threshold
  probe_status_codes         = var.probe_status_codes
  ssl_certificate_data       = filebase64("${path.module}/agw.pfx")
  ssl_certificate_password   = var.ssl_certificate_password
  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id
  diag_storage_account_name  = local.diag_storage_name
  diag_log_categories        = var.diag_log_categories

  # New variablized parameters
  public_ip_allocation_method         = var.public_ip_allocation_method
  public_ip_sku                       = var.public_ip_sku
  storage_account_tier                = var.storage_account_tier
  storage_account_replication_type    = var.storage_account_replication_type
  gateway_ip_configuration_name       = var.gateway_ip_configuration_name
  cookie_based_affinity               = var.cookie_based_affinity
  pick_host_name_from_backend_address = var.pick_host_name_from_backend_address
  routing_rule_type                   = var.routing_rule_type
  routing_rule_priority               = var.routing_rule_priority
  url_path_rules                      = var.url_path_rules
  url_path_rule_name                  = var.url_path_rule_name
  probe_pick_host_name_from_backend   = var.probe_pick_host_name_from_backend
  probe_host                          = var.probe_host
  diag_metric_category                = var.diag_metric_category
  use_public_ca                       = var.use_public_ca
  trusted_root_certificate_data       = var.use_public_ca ? null : filebase64("${path.module}/agw.crt")

  tags = local.agw_tags
}
