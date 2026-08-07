location            = "Central India"
resource_group_name = "Buildpiper-test"

workspace_name    = "bp-log-analytics-dev"
sku               = "PerGB2018"
retention_in_days = 30

tags = {
  Name          = "BP-LogAnalytics-DEV-S1-1"
  CC            = "BP_DEV_LogAnalytics"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "Newgen"
}
