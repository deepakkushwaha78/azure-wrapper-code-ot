client_code         = "BP"
client_name         = "newgen"
environment         = "DEV"
resource_group_name = "Buildpiper-test"
location            = "Central India"

# Redis Configuration as per client requirements
capacity = 1       # 1GB cache size
sku_name = "Basic" # Basic SKU
family   = "C"
minimum_tls_version =  "1.2"
public_network_access_enabled = false

# Additional custom tags
tags = {
  CC            = "BP_DEV_Redis"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "NewGen"
}
