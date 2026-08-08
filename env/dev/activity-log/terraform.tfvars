diagnostic_name    = "activity-log-to-blob"
resource_group_name = "Buildpiper-test"
location            = "Central India"
storage_account_id = [
  "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/Microsoft.Storage/storageAccounts/buildpiperstate"
]

log_categories = [
  "Administrative",
  "Security",
  "Policy"
]

action_group_name       = "admin-alert-ag"
action_group_short_name = "adminag"

email_receivers = []

alert_name        = "vm-delete-alert"
alert_description = "Alert when VM is deleted"

alert_category = "Administrative"
operation_name = "Microsoft.Compute/virtualMachines/delete"