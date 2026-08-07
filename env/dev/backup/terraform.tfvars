location            = "Central India"
resource_group_name = "Buildpiper-test"

# -----------------------------------------------------------------------
# RECOVERY VAULT CONFIGURATION
# -----------------------------------------------------------------------
vault_name = "Backup-vault-DEV-S1-1"
vault_sku  = "Standard"

# Cross-region restore and vault settings
cross_region_restore_enabled = true
soft_delete_enabled          = true
storage_mode_type            = "GeoRedundant"

# -----------------------------------------------------------------------
# BACKUP POLICY CONFIGURATION
# -----------------------------------------------------------------------
vm_policy_name = "BackupPolicyVMDEVS11"

# Schedule: Daily at 05:00 UTC
timezone    = "UTC"
backup_time = "05:00"

# Retention: 7 days = 1 Week
retention_daily_count = 7

# -----------------------------------------------------------------------
# AZURE SITE RECOVERY CONFIGURATION
# -----------------------------------------------------------------------
enable_site_recovery                                     = false
target_location                                          = "South India"
target_resource_group_name                               = "Buildpiper-test-dr"
replication_policy_name                                  = "BP-replication-policy-dev"
recovery_point_retention_in_minutes                      = 1440
application_consistent_snapshot_frequency_in_minutes     = 240

# -----------------------------------------------------------------------
# TAG-BASED VM SELECTION
# -----------------------------------------------------------------------
# VMs are NOT listed manually here. Instead, backup automatically applies
# to any VM that has the following tag set:
#
#   Tag Key   : Backup
#   Tag Value : True
#
# How it works:
#   data.tf fetches all VMs in the resource group with tag Backup=True
#   and passes them to the module automatically at plan/apply time.
#
# To INCLUDE a VM in backup  → add tag: Backup = True  on that VM
# To EXCLUDE a VM from backup → do not add the tag (or remove it)
#
# Note: AKS cluster nodes should NOT have this tag, so they are
# automatically excluded from backup.
# -----------------------------------------------------------------------

tags = {
  Name          = "Backup-vault-DEV-S1-1"
  CC            = "1111_DEV_Backup"
  CC-Project    = "1111_DEV"
  Customer-Code = "1111"
  Environment   = "DEV"
  Project       = "ClientProject"
}
