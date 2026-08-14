module "activity_log" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-activity-log?ref=azure"

  location           = var.location
  diagnostic_name    = var.diagnostic_name
  target_resource_id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}"
  storage_account_id = var.storage_account_id
  log_categories     = var.log_categories

  action_group_name       = var.action_group_name
  action_group_short_name = var.action_group_short_name
  resource_group_name     = var.resource_group_name
  email_receivers         = var.email_receivers

  alert_name        = var.alert_name
  alert_description = var.alert_description
  scopes            = ["/subscriptions/${data.azurerm_client_config.current.subscription_id}"]
  alert_category    = var.alert_category
  operation_name    = var.operation_name
}