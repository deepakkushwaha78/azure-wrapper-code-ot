locals {
  # ACR name must be alphanumeric only (no underscores), 5-50 chars
  # Client display name BP_ACR_DEV is set in tags, resource name is BPACRDEV
  acr_name = lower("${var.customer_code}acr${var.environment}ng")
}
