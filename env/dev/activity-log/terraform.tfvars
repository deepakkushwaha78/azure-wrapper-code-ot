diagnostic_name    = "activity-log-to-blob"
resource_group_name = "Buildpiper-test"
location            = "Central India"
storage_account_id = [
  "/subscriptions/787ff5ea-eda4-47f2-b1a6-751605952ca7/resourceGroups/Buildpiper-test/providers/Microsoft.Storage/storageAccounts/bpblobdevng"
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