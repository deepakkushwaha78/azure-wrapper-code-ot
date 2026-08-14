customer_code       = "BP"
environment         = "DEV"
project_name        = "ClientProject"
resource_group_name = "buildpiper"
location            = "Central India"

sku                           = "Premium"
admin_enabled                 = false
public_network_access_enabled = false

georeplications = [
  {
    location                = "South India"
    zone_redundancy_enabled = false
  }
]

tags = {
  Name          = "BP_ACR_DEV"
  CC            = "BP_DEV_ACR"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
}
