customer_code       = "230792"
environment         = "DEV"
resource_group_name = "Buildpiper-test"
location            = "Central India"

# Client's on-premises gateway IP address (sample)
gateway_ip_address = "203.0.113.10"

# Client's on-premises network address spaces (sample)
client_address_spaces = [
  "192.168.0.0/16",
  "10.0.0.0/8"
]

# Optional BGP settings (uncomment if BGP is required)
# bgp_settings = {
#   asn                 = 65000
#   bgp_peering_address = "192.168.1.1"
#   peer_weight         = 0
# }

# Additional custom tags
tags = {
  Name          = "BP-DB-DEV-S1-1"
  CC            = "BP_DEV_DB"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
}
