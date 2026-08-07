module "nsg" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-network-security-group?ref=azure"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  subnets                 = local.subnets
  nsg_rules               = local.nsg_rules
  tags                    = local.common_tags

  # NSG Flow Logs Configuration (subnet-level via NSG)
  enable_flow_logs                    = var.enable_flow_logs
  flow_log_storage_account_id         = var.flow_log_storage_account_id
  flow_log_workspace_id               = var.flow_log_workspace_id
  flow_log_retention_days             = var.flow_log_retention_days
  flow_log_traffic_analytics_interval = var.flow_log_traffic_analytics_interval
  network_watcher_name                = var.network_watcher_name
  network_watcher_resource_group      = var.network_watcher_resource_group
}
