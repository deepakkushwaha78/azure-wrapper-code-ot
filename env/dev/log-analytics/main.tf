module "log_analytics" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-log-analytics?ref=azure"

  workspace_name      = var.workspace_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}
