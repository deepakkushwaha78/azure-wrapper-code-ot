resource_group_name = "Buildpiper-test"

virtual_network_name = "BP_VPC_DEV_S1_1"

name     = "bp-db-dev-s1-1"
location = "Central India"

db_username = "dbadmin"
db_password = "newgen123"

posgressversion = "16"

# Memory Optimized + Standard_E2s_v3 (correct SKU format)
sku_name = "MO_Standard_E2s_v3"

# 128 GB storage
storage_mb = 131072

# Dev/Test workload → lower backup acceptable
backup_retention_days = 7

# HA: SameZone standby replica; set true to enable
high_availability_enabled = false

# Maintenance window: Sunday (day_of_week=0) at 03:00 UTC
# day_of_week: 0=Sunday, 1=Monday ... 6=Saturday
maintenance_window_day    = 0
maintenance_window_hour   = 3
maintenance_window_minute = 0

# DR: geo-redundant backup (GRS) - stores backup in paired Azure region
geo_redundant_backup_enabled = false

# Diagnostic settings: logs sent to AGW's Log Analytics + Storage Account (reused)
# Set true to enable, IDs are auto-fetched from AGW remote state
enable_diagnostic_settings = true
log_analytics_workspace_id  = "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/Microsoft.OperationalInsights/workspaces/bp-log-analytics-dev"

# Private access configuration
private_dns_zone_name                      = "newgen.postgres.database.azure.com"
private_dns_zone_virtual_network_link_name = "newgen"
mode                                       = "samezone"
diagnostic_log_categories                  = ["PostgreSQLLogs", "PostgreSQLFlexDatabaseXacts"]
# Zone selection
postgres_zones = 1

# -----------------------------------------------------------------------
# AUDIT AND LOGS STORAGE ACCOUNTS
# -----------------------------------------------------------------------
# Audit Storage: 18 months retention for compliance
enable_audit_storage       = true
audit_storage_account_name = "bpdbauditdevs11"

# Logs Storage: 3 months retention for operational logs
enable_logs_storage       = true
logs_storage_account_name = "bpdblogsdevs11"

# -----------------------------------------------------------------------
# MONITORING ALERTS (CPU, Memory, Storage)
# -----------------------------------------------------------------------
enable_alerts           = true
action_group_id         = "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/microsoft.insights/actionGroups/bp-postgres-alerts"
cpu_alert_threshold     = 80
memory_alert_threshold  = 80
storage_alert_threshold = 80

tags = {
  Name          = "BP-DB-DEV-S1-1"
  CC            = "BP_DEV_DB"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
}