# -------------------------------------------------------
# Client & Environment  (single source of truth for naming + tags)
# -------------------------------------------------------
client_code = "BP"
client_name = "Newgen"
environment = "DEV"

# -------------------------------------------------------
# Resource Group (location derived from RG via data source)
# -------------------------------------------------------
resource_group_name = "buildpiper"

# -------------------------------------------------------
# Storage Account - File Share
# Name auto-generated: <clientcode>fileshare<env> => bpfilesharedev
# -------------------------------------------------------
account_tier                  = "Standard" # Performance: Standard
account_replication_type      = "LRS"      # Non-Prod: LRS | Prod: GRS
access_tier                   = "Hot"      # Hot / Cool as per request
public_network_access_enabled = false      # Public access: Disabled
share_retention_days          = 7

# -------------------------------------------------------
# File Share Config
# Name auto-generated from client_code + environment
# -------------------------------------------------------
file_share_config = {
  quota_gb    = 100
  access_tier = "Hot" # Hot / Cool / TransactionOptimized
}

# -------------------------------------------------------
# Remote State - Network
# -------------------------------------------------------
tf_state_resource_group  = "buildpiper"
tf_state_storage_account = "terraformstatebp"
tf_state_container       = "state-file"
tf_state_network_key     = "env/dev/network-skeleton/terraform.tfstate"

# -------------------------------------------------------
# Extra Tags (optional)
# -------------------------------------------------------
tags = {
  ManagedBy = "Terraform"
}

# -------------------------------------------------------
# Storage Account Configuration
# -------------------------------------------------------
account_kind                 = "StorageV2"
min_tls_version              = "TLS1_2"
network_rules_default_action = "Deny"
network_rules_bypass         = ["AzureServices"]

# Diagnostics
diagnostic_settings_enabled = false
log_analytics_workspace_id  = "/subscriptions/918ba53a-0b00-48ca-b894-5584a28bf4f1/resourceGroups/buildpiper/providers/Microsoft.OperationalInsights/workspaces/bp-log-analytics-dev"
