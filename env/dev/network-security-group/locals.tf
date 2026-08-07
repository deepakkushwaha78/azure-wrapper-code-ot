locals {
  # Pick rules for current environment (prod or non-prod)
  env_rules = var.default_nsg_rules[var.environment]

  # Per service: merge env default rules + any service-specific extra rules
  # If skip_outbound_deny = true, remove Outbound-DenyAll (required for AGW V2)
  nsg_rules = {
    for service_name, service_config in var.services : service_name => {
      rules = merge(
        service_config.skip_outbound_deny
          ? { for k, v in local.env_rules : k => v if k != "Outbound-DenyAll" }
          : local.env_rules,
        lookup(var.service_extra_rules, service_name, {})
      )
    }
  }

  # Map of subnet IDs for each service
  subnets = {
    for service_name in keys(var.services) : service_name => data.azurerm_subnet.service_subnets[service_name].id
  }

  # Common tags applied to all NSG resources
  common_tags = {
    CC              = "${upper(var.client_code)}_${var.env_label}_NSG"
    "CC-Project"    = "${upper(var.client_code)}_${var.env_label}"
    "Customer-Code" = upper(var.client_code)
    Environment     = var.env_label
    Project         = var.client_name
  }
}
