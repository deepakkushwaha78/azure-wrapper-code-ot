location            = "Central India"
resource_group_name = "buildpiper"

storage_account_name = "bpblobdevng01"
account_tier         = "Standard"
# Replication options: LRS (local only), GRS (geo-redundant), RAGRS (read-access geo-redundant)
account_replication_type      = "GRS"
access_tier                   = "Hot"
public_network_access_enabled = false
blob_versioning_enabled       = true
containers = {
  "data" = {
    container_access_type = "private"
  }
}

allowed_ip_ranges  = []
allowed_subnet_ids = []

tags = {
  Name          = "BP-Blob-DEV-S1-1"
  CC            = "BP_DEV_Blob"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "Newgen"
}

# TLS Configuration
min_tls_version = "TLS1_2"

# Network Rules
network_rules_default_action = "Deny"
network_rules_bypass         = ["AzureServices"]

# Hierarchical Namespace (Data Lake Gen2)
is_hns_enabled = false

# Diagnostics
diagnostic_settings_enabled = false
log_analytics_workspace_id  = "/subscriptions/918ba53a-0b00-48ca-b894-5584a28bf4f1/resourceGroups/buildpiper/providers/Microsoft.OperationalInsights/workspaces/bp-log-analytics-dev"

# Log Archival for Audit (configure storage account ID for archiving logs)
log_retention_days         = 365
archive_storage_account_id = null # Set to storage account ID for archival: "/subscriptions/<sub-id>/resourceGroups/<rg>/providers/Microsoft.Storage/storageAccounts/<name>"
