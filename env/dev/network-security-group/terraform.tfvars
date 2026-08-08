resource_group_name     = "Buildpiper-test"
resource_group_location = "Central India"
environment             = "non-prod"
env_label               = "DEV"
client_code             = "BP"
client_name             = "NewGen"

vnet_name                = "BP_VPC_DEV_S1_1"
vnet_resource_group_name = "Buildpiper-test"

# ---------------------------------------------------------------
# Default NSG rules — split by environment
# non-prod and prod have different AD/PMP IPs
#
# HOW TO USE:
#   - Change a port     → update destination_port_range in that rule
#   - Change priority   → update priority field
#   - Add a new rule    → add a new block under both non-prod and prod
#   - Change IPs        → update source_address_prefix / destination_address_prefix
# ---------------------------------------------------------------
default_nsg_rules = {

  "non-prod" = {

    # ---- INGRESS ----
    "Inbound-AD-UDP" = {
      name                       = "AD-UDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "445,138,464,135,389,53,123,137,139,88"
      source_address_prefix      = "10.246.2.38,10.246.2.43"
      destination_address_prefix = "*"
    }

    "Inbound-AD-TCP" = {
      name                       = "AD-TCP"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "464,389,445,138,88,137,139,135,636,53,49152-65535"
      source_address_prefix      = "10.246.2.38,10.246.2.43"
      destination_address_prefix = "*"
    }

    "Inbound-PMP" = {
      name                       = "PMP"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389,22"
      source_address_prefix      = "10.246.2.41"
      destination_address_prefix = "*"
    }

    "Inbound-DenyAll" = {
      name                       = "DenyAnyCustomAnyInbound"
      priority                   = 4050
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    # ---- EGRESS ----
    "Outbound-AD-UDP" = {
      name                       = "AD_UDP"
      priority                   = 110
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "445,135,389,53,123,88"
      source_address_prefix      = "*"
      destination_address_prefix = "10.246.2.38,10.246.2.43"
    }

    "Outbound-AD-TCP" = {
      name                       = "AD_TCP"
      priority                   = 120
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "464,49152-65535,389,445,138,3268,88,137,139,135,636,3269,53"
      source_address_prefix      = "*"
      destination_address_prefix = "10.246.2.38,10.246.2.43"
    }

    "Outbound-DenyAll" = {
      name                       = "DenyAnyCustomAnyOutbound"
      priority                   = 4050
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }

  "prod" = {

    # ---- INGRESS ----
    "Inbound-AD-UDP" = {
      name                       = "AD-UDP"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "445,138,464,135,389,53,123,137,139,88"
      source_address_prefix      = "10.255.2.34,10.255.2.183"
      destination_address_prefix = "*"
    }

    "Inbound-AD-TCP" = {
      name                       = "AD-TCP"
      priority                   = 120
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "464,389,445,138,88,137,139,135,636,53,49152-65535"
      source_address_prefix      = "10.255.2.34,10.255.2.183"
      destination_address_prefix = "*"
    }

    "Inbound-PMP" = {
      name                       = "PMP"
      priority                   = 130
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "3389,22"
      source_address_prefix      = "10.255.2.168"
      destination_address_prefix = "*"
    }

    "Inbound-DenyAll" = {
      name                       = "DenyAnyCustomAnyInbound"
      priority                   = 4050
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }

    # ---- EGRESS ----
    "Outbound-AD-UDP" = {
      name                       = "AD_UDP"
      priority                   = 110
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Udp"
      source_port_range          = "*"
      destination_port_range     = "445,135,389,53,123,88"
      source_address_prefix      = "*"
      destination_address_prefix = "10.255.2.34,10.255.2.183"
    }

    "Outbound-AD-TCP" = {
      name                       = "AD_TCP"
      priority                   = 120
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "464,49152-65535,389,445,138,3268,88,137,139,135,636,3269,53"
      source_address_prefix      = "*"
      destination_address_prefix = "10.255.2.34,10.255.2.183"
    }

    "Outbound-DenyAll" = {
      name                       = "DenyAnyCustomAnyOutbound"
      priority                   = 4050
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}

# ---------------------------------------------------------------
# Service-specific EXTRA rules (optional)
# Merged ON TOP of default_nsg_rules for that service only
#
# HOW TO USE:
#   - Add rules for a service  → add/extend that service's block
#   - AGW needs Azure V2 SKU ports (65200-65535) — already defined below
#   - Any new service rule     → add a new service key here
# ---------------------------------------------------------------
# ---------------------------------------------------------------
# Service-specific EXTRA rules (optional)
# Merged ON TOP of default_nsg_rules for that service only
#
# AGW NOTE: Azure Application Gateway V2 SKU mandatorily requires:
#   - Inbound 65200-65535 from GatewayManager (Azure health probes)
#   - Inbound 65200-65535 from Internet
#   - Outbound to Internet (for AGW to function)
#   These are NOT in client default rules but are Azure platform requirements.
#   Ref: https://learn.microsoft.com/en-us/azure/application-gateway/configuration-infrastructure#network-security-groups
#
# HOW TO USE:
#   - Add rules for any service  → add a new service key with rule blocks
#   - Remove AGW extra rules     → only if not using Application Gateway V2 SKU
# ---------------------------------------------------------------
service_extra_rules = {
  "agw" = {
    # Azure mandatory: AGW V2 health probe ports
    "Inbound-GatewayManager" = {
      name                       = "GatewayManager"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "65200-65535"
      source_address_prefix      = "GatewayManager"
      destination_address_prefix = "*"
    }
    "Inbound-Internet-AGW" = {
      name                       = "Internet-AGW"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "65200-65535"
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
    # Azure mandatory: AGW needs outbound internet access
    "Outbound-Internet-AGW" = {
      name                       = "Outbound-Internet-AGW"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "Internet"
    }
  }
}

# ---------------------------------------------------------------
# Services → subnet mapping
# NSG Name = service key  e.g. "aks" → NSG name = "aks"
# Tag Name  = BP-aks-DEV-S1-1  (built automatically)
#
# Subnets from network-skeleton:
#   SUB2 → AGW
#   SUB4 → VM
#   SUB5 → PostgreSQL (postgres delegation)
#   SUB7 → AKS
#   SUB8 → Monolithic
# ---------------------------------------------------------------
services = {
  "aks" = {
    subnet_name = "BP_SUB7_DEV_S1_1"
  }
  "monolithic" = {
    subnet_name = "BP_SUB8_DEV_S1_1"
  }
  "database" = {
    subnet_name = "BP_SUB5_DEV_S1_1"
  }
  "agw" = {
    subnet_name        = "BP_SUB2_DEV_S1_1"
    skip_outbound_deny = true
  }
  "vm" = {
    subnet_name = "BP_SUB4_DEV_S1_1"
  }
}

# ---------------------------------------------------------------
# NSG Flow Logs Configuration
# Flow logs are configured at NSG (subnet) level for granular traffic analysis
# Retention: 30 days for non-prod, 90 days for prod
# ---------------------------------------------------------------
enable_flow_logs                    = true
flow_log_storage_account_id         = "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/Microsoft.Storage/storageAccounts/bpblobdevng"
flow_log_workspace_id               = "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/Microsoft.OperationalInsights/workspaces/bp-log-analytics-dev"
flow_log_retention_days             = 30  # 30 days for non-prod, change to 90 for prod
flow_log_traffic_analytics_interval = 60
network_watcher_name                = "NetworkWatcher_centralindia"
network_watcher_resource_group      = "NetworkWatcherRG"
