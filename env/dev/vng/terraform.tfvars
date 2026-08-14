customer_code       = "BP"
environment         = "DEV"
project_name        = "ClientProject"
resource_group_name = "buildpiper"
location            = "Central India"

vnet_name = "BP_VPC_DEV_S1_1"

pip_name      = "BP-VNG-DEV-S1-1-pip"
sku           = "VpnGw1AZ"
generation    = "Generation1"
active_active = false
bgp_enabled   = false

tags = {
  Name          = "BP-VNG-DEV-S1-1"
  CC            = "BP_DEV_Vng"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
}
