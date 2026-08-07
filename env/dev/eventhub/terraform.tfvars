# ----------------------------------------
# Project Identity
# ----------------------------------------
clientcode          = "BP"
env                 = "dev"
resource_group_name = "Buildpiper-test"
location            = "Central India"

# ----------------------------------------
# Networking
# ----------------------------------------
vnet_name   = "BP_VPC_DEV_S1_1"
subnet_name = "BP_SUB4_DEV_S1_1"

# ----------------------------------------
# EventHub Namespace (Kafka)
# Name auto-generated: kafka-<clientcode>-<env> → kafka-BP-dev
# ----------------------------------------
sku                          = "Standard"
throughput_units             = 1
local_authentication_enabled = true
# Connectivity: Private (public access always disabled)
# Private Endpoint will be attached separately via private-endpoint module

# ----------------------------------------
# EventHub (Kafka Topic)
# ----------------------------------------
eventhub_name     = "bp-kafka-topic"
partition_count   = 2
message_retention = 1
public_access_network_enable = false
# ----------------------------------------
# Tags
# ----------------------------------------
tags = {
  CC            = "BP_DEV_Kafka"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
  ManagedBy     = "Terraform"
}
