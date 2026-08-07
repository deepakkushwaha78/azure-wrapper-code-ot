module "postgres" {
  source                                     = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-postgres?ref=azure"
  private_dns_zone_name                      = var.private_dns_zone_name
  private_dns_zone_virtual_network_link_name = var.private_dns_zone_virtual_network_link_name
  name                                       = var.name
  location                                   = var.location
  resource_group_name                        = var.resource_group_name
  virtual_network_name                       = var.virtual_network_name
  subnet_id                                  = data.terraform_remote_state.network.outputs.aks_subnet_ids["subnet5"]
  virtual_network_id                         = data.terraform_remote_state.network.outputs.aks_vnet_id
  db_username                                = var.db_username
  db_password                                = var.db_password
  security_rule                              = var.security_rule
  posgressversion                            = var.posgressversion
  storage_mb                                 = var.storage_mb
  sku_name                                   = var.sku_name
  backup_retention_days                      = var.backup_retention_days
  tags                                       = var.tags
  postgres_zones                             = var.postgres_zones
  mode                                       = var.mode
  enable_diagnostic_settings   = var.enable_diagnostic_settings
  log_analytics_workspace_id    = var.log_analytics_workspace_id  # Maintenance window: client controls via tfvars
  maintenance_window_day    = var.maintenance_window_day
  maintenance_window_hour   = var.maintenance_window_hour
  maintenance_window_minute = var.maintenance_window_minute

  # HA: pass toggle to module
  high_availability_enabled = var.high_availability_enabled

  # DR: geo-redundant backup (GRS option)
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled

  # Diagnostic settings: reuse AGW's Storage Account + Log Analytics Workspace
  # IDs fetched from AGW remote state - no manual input needed in tfvars
  diagnostic_storage_account_id = data.terraform_remote_state.agw.outputs.diag_storage_account_id

  # Audit and Logs Storage
  enable_audit_storage        = var.enable_audit_storage
  audit_storage_account_name  = var.audit_storage_account_name
  enable_logs_storage         = var.enable_logs_storage
  logs_storage_account_name   = var.logs_storage_account_name

  # Monitoring Alerts
  enable_alerts            = var.enable_alerts
  action_group_id          = var.action_group_id
  cpu_alert_threshold      = var.cpu_alert_threshold
  memory_alert_threshold   = var.memory_alert_threshold
  storage_alert_threshold  = var.storage_alert_threshold
  diagnostic_log_categories = var.diagnostic_log_categories
}