module "storage_account" {

  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-storage-account?ref=azure"

  storage_account_name          = var.storage_account_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  access_tier                   = var.access_tier
  public_network_access_enabled = var.public_network_access_enabled
  blob_versioning_enabled       = var.blob_versioning_enabled
  containers                    = var.containers
  allowed_ip_ranges             = var.allowed_ip_ranges
  allowed_subnet_ids            = var.allowed_subnet_ids
  min_tls_version               = var.min_tls_version
  network_rules_default_action  = var.network_rules_default_action
  network_rules_bypass          = var.network_rules_bypass
  is_hns_enabled                = var.is_hns_enabled
  diagnostic_settings_enabled   = var.diagnostic_settings_enabled
  log_analytics_workspace_id    = var.log_analytics_workspace_id
  log_retention_days            = var.log_retention_days
  archive_storage_account_id    = var.archive_storage_account_id
  tags                          = var.tags
}
