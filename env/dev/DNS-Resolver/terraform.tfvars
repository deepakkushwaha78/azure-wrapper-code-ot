name                = "BP-dns-resolver"
resource_group_name = "Buildpiper-test"
location            = "Central India"
subnet_name         = "subnet9"
forwarding_rules = {
  nonprod_rule = {
    domain_name = "newgenclouduat.com."

    target_dns_servers = [
      {
        ip   = "10.246.2.43"
        port = 53
      },
      {
        ip   = "10.246.2.38"
        port = 53
      }
    ]
  }

  prod_rule = {
    domain_name = "newgencloudservices.com."

    target_dns_servers = [
      {
        ip   = "10.255.2.34"
        port = 53
      },
      {
        ip   = "10.255.2.183"
        port = 53
      }
    ]
  }
}

vnet_links = {
  aks_vnet_link = {
    vnet_id = "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/Microsoft.Network/virtualNetworks/BP_VPC_DEV_S1_1"
  }
  monolithic_vnet_link = {
    vnet_id = "/subscriptions/e733803c-caff-4e00-9e38-875404b339e8/resourceGroups/Buildpiper-test/providers/Microsoft.Network/virtualNetworks/BP_VPC_PRD_S1_1"
  }
}

tags = {
  Name           = "BP-dns-resolver"
  CC             = "BP-dns-resolver"
  CC-Project     = "BP_DEV"
  Customer-Code  = "BP"
  Environment    = "DEV"
  Project        = "ClientProject"
}