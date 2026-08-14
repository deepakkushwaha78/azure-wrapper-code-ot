customer_code       = "BP"
environment         = "DEV"
project_name        = "ClientProject"
resource_group_name = "buildpiper"
location            = "Central India"

vng_name = "BP-VNG-DEV-S1-1"

# Placeholder values - please update with on-premises VPN device details
local_gateway_address = "1.2.3.4"
local_address_space   = ["192.168.1.0/24"]
shared_key            = "fGrVhhCn9P1JWY08XMS4Z9kDOzCuCMMdpGwm0EcxC+w="

tags = {
  Name          = "BP-VPN-DEV-S1-1"
  CC            = "BP_DEV_Vpn"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
}
