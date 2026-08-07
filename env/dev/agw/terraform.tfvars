# ----------------------------------------
# Project Identity
# ----------------------------------------
clientcode          = "BP"
env                 = "dev"
resource_group_name = "Buildpiper-test"
location            = "Central India"

# ----------------------------------------
# Networking
# ----------------------------------------
vnet_name   = "BP_VPC_DEV_S1_1"
subnet_name = "BP_SUB2_DEV_S1_1"

# ----------------------------------------
# Application Gateway SKU & Scaling
# ----------------------------------------
sku_name               = "Standard_v2"
sku_tier               = "Standard_v2"
autoscale_min_capacity = 0
autoscale_max_capacity = 10

# ----------------------------------------
# Backend
# ----------------------------------------
backend_ips             = ["10.0.0.1"]
backend_port            = 443
backend_protocol        = "Https"
backend_request_timeout = 320

# ----------------------------------------
# Frontend Listener
# ----------------------------------------
frontend_port     = 443
listener_protocol = "Https"

# ----------------------------------------
# SSL Certificate
# ----------------------------------------
ssl_certificate_password = "OpstreeAzure@123"

# ----------------------------------------
# Health Probe
# ----------------------------------------
probe_path                = "/"
probe_interval            = 30
probe_timeout             = 30
probe_unhealthy_threshold = 3
probe_status_codes        = ["200-399"]

# ----------------------------------------
# Diagnostics
# ----------------------------------------
law_retention_days = 30
diag_log_categories = [
  "ApplicationGatewayAccessLog",
  "ApplicationGatewayPerformanceLog",
  "ApplicationGatewayFirewallLog"
]

# ----------------------------------------
# Tags
# ----------------------------------------
tags = {
  CC            = "BP_DEV_AGW"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
  ManagedBy     = "Terraform"
}

# ----------------------------------------
# Public IP Configuration
# ----------------------------------------
public_ip_allocation_method = "Static"
public_ip_sku               = "Standard"

# ----------------------------------------
# Storage Account Configuration
# ----------------------------------------
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"

# ----------------------------------------
# Gateway Configuration
# ----------------------------------------
gateway_ip_configuration_name = "appGatewayIpConfig"

# ----------------------------------------
# Backend HTTP Settings
# ----------------------------------------
cookie_based_affinity               = "Disabled"
pick_host_name_from_backend_address = false

# ----------------------------------------
# Certificate Authority Configuration
# ----------------------------------------
# Set to true for Public CA (default), false for Private CA
use_public_ca = true
# trusted_root_certificate_data is only needed when use_public_ca = false

# ----------------------------------------
# Routing Rule
# ----------------------------------------
routing_rule_type     = "PathBasedRouting"
routing_rule_priority = 1
url_path_rules        = ["/test/*", "/api/*"]
url_path_rule_name    = "test-path-rule"

# ----------------------------------------
# Probe Configuration
# ----------------------------------------
probe_pick_host_name_from_backend = false
probe_host                        = "10.0.0.1"

# ----------------------------------------
# Diagnostics Metrics
# ----------------------------------------
diag_metric_category = "AllMetrics"
