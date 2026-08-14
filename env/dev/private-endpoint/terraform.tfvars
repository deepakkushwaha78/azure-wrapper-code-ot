location            = "Central India"
resource_group_name = "buildpiper"

vnet_name   = "BP_VPC_DEV_S1_1"
subnet_name = "BP_SUB6_DEV_S1_1"

tags = {
  Name          = "BP-PE-DEV-S1-1"
  CC            = "BP_DEV_PE"
  CC-Project    = "BP_DEV"
  Customer-Code = "BP"
  Environment   = "DEV"
  Project       = "ClientProject"
}

# -------------------------------------------------------
# Client manages this block — add/remove/rename as needed
# -------------------------------------------------------
private_endpoints = {

  blob = {
    name              = "BP-Blob-DEV-S1-1-pe"
    subresource_names = ["blob"]
    dns_zone_name     = "privatelink.blob.core.windows.net"
    vnet_link_name    = "blob-dns-link"
  }

  acr = {
    name              = "BP-ACR-DEV-S1-1-pe"
    subresource_names = ["registry"]
    dns_zone_name     = "privatelink.azurecr.io"
    vnet_link_name    = "acr-dns-link"
  }

  # redis = {
  #   name              = "BP-Redis-DEV-S1-1-pe"
  #   subresource_names = ["redisCache"]
  #   dns_zone_name     = "privatelink.redis.cache.windows.net"
  #   vnet_link_name    = "redis-dns-link"
  # }

  eventhub = {
    name              = "BP-Kafka-DEV-S1-1-pe"
    subresource_names = ["namespace"]
    dns_zone_name     = "privatelink.servicebus.windows.net"
    vnet_link_name    = "eventhub-dns-link"
  }
}
