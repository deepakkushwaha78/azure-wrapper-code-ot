module "backup" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-backup?ref=azure"

  vault_name          = var.vault_name
  location            = var.location
  resource_group_name = data.azurerm_resource_group.rg.name
  vault_sku           = var.vault_sku

  # Cross-region restore and vault configuration
  cross_region_restore_enabled = var.cross_region_restore_enabled
  soft_delete_enabled          = var.soft_delete_enabled
  storage_mode_type            = var.storage_mode_type

  vm_policy_name        = var.vm_policy_name
  timezone              = var.timezone
  backup_time           = var.backup_time
  retention_daily_count = var.retention_daily_count

  # Azure Site Recovery configuration
  enable_site_recovery                                 = var.enable_site_recovery
  target_location                                      = var.target_location
  target_resource_group_name                           = var.target_resource_group_name
  replication_policy_name                              = var.replication_policy_name
  recovery_point_retention_in_minutes                  = var.recovery_point_retention_in_minutes
  application_consistent_snapshot_frequency_in_minutes = var.application_consistent_snapshot_frequency_in_minutes

  # Tag Backup=True wale VMs automatically fetch hote hain data.tf se
  vm_ids = {
    for r in data.azurerm_resources.tagged_vms.resources : r.name => r.id
  }

  tags = var.tags
}
