locals {
  storage_account_name = "${lower(var.client_code)}fileshare${lower(var.environment)}"

  common_tags = {
    Name            = "${var.client_code}-FileShare-${var.environment}-S1-1"
    CC              = "${var.client_code}_${var.environment}_Blob"
    "CC-Project"    = "${var.client_code}_${var.environment}"
    "Customer-Code" = var.client_code
    Environment     = var.environment
    Project         = var.client_name
  }
}

module "storage_file_share" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-storage-file-share?ref=azure"

  storage_account_name          = local.storage_account_name
  resource_group_name           = data.azurerm_resource_group.rg.name
  location                      = data.azurerm_resource_group.rg.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  access_tier                   = var.access_tier
  public_network_access_enabled = var.public_network_access_enabled
  share_retention_days          = var.share_retention_days

  # New variablized parameters
  account_kind                 = var.account_kind
  min_tls_version              = var.min_tls_version
  network_rules_default_action = var.network_rules_default_action
  network_rules_bypass         = var.network_rules_bypass

  file_shares = {
    (local.storage_account_name) = var.file_share_config
  }
  diagnostic_settings_enabled = var.diagnostic_settings_enabled
  log_analytics_workspace_id  = var.log_analytics_workspace_id
  tags                        = merge(local.common_tags, var.tags)
}
