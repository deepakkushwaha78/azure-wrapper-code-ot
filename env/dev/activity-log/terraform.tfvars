diagnostic_name     = "activity-log-to-blob"
resource_group_name = "buildpiper"
location            = "Central India"
storage_account_id = [
  "/subscriptions/918ba53a-0b00-48ca-b894-5584a28bf4f1/resourceGroups/buildpiper/providers/Microsoft.Storage/storageAccounts/terraformstatebp"
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