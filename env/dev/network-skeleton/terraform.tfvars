location            = "Central India"
resource_group_name = "Buildpiper-test"

vnet1_name = "BP_VPC_DEV_S1_1"
vnet1_cidr = "10.215.0.0/21"

vnet1_subnets = {

  subnet1 = {
    name    = "BP_SUB1_DEV_S1_1"
    cidr    = "10.215.0.0/27"
    
  }

  subnet2 = {
    name    = "BP_SUB2_DEV_S1_1"
    cidr    = "10.215.0.32/27"
    
  }

  subnet3 = {
    name    = "BP_SUB3_DEV_S1_1"
    cidr    = "10.215.0.64/27"
    
  }

  subnet4 = {
    name    = "BP_SUB4_DEV_S1_1"
    cidr    = "10.215.0.96/27"
    rt_name = "rt-aks-subnet4"
  }

  subnet5 = {
    name    = "BP_SUB5_DEV_S1_1"
    cidr    = "10.215.0.128/27"
    rt_name = "rt-aks-subnet5"
    delegation = "postgres"

  }

  subnet6 = {
    name    = "BP_SUB6_DEV_S1_1"
    cidr    = "10.215.0.192/26"
    
  }

  subnet7 = {
    name    = "BP_SUB7_DEV_S1_1"
    cidr    = "10.215.2.0/23"
    rt_name = "rt-aks-subnet7"
  }

  subnet8 = {
    name    = "BP_SUB8_DEV_S1_1"
    cidr    = "10.215.0.160/28"
    
  }

  subnet9 = {
    name    = "BP_SUB9_DEV_S1_1"
    cidr    = "10.215.0.176/28"

    delegation = "dnsResolvers"
  }

  gateway = {
    name = "GatewaySubnet"
    cidr = "10.215.1.0/27"
  }
}

vnet2_name = "BP_VPC_PRD_S1_1"
vnet2_cidr = "10.249.96.0/21"

vnet2_subnets = {

  subnet1 = {
    name    = "BP_SUB1_PRD_S1_1"
    cidr    = "10.249.96.0/28"
   
  }

  subnet2 = {
    name    = "BP_SUB2_PRD_S1_1"
    cidr    = "10.249.96.32/27"
   
  }

  subnet3 = {
    name    = "BP_SUB3_PRD_S1_1"
    cidr    = "10.249.96.64/27"
    rt_name = "rt-monolithic-subnet3"
  }

  subnet4 = {
    name    = "BP_SUB4_PRD_S1_1"
    cidr    = "10.249.96.96/27"
    rt_name = "rt-monolithic-subnet4"
  }

  subnet5 = {
    name    = "BP_SUB5_PRD_S1_1"
    cidr    = "10.249.96.128/27"
    
  }

  subnet6 = {
    name    = "BP_SUB6_PRD_S1_1"
    cidr    = "10.249.96.16/28"
    
  }

  subnet7 = {
    name    = "BP_SUB7_PRD_S1_1"
    cidr    = "10.249.96.192/27"
   
  }

  gateway = {
    name = "GatewaySubnet"
    cidr = "10.249.96.160/27"
  }
}

tags = {
  Name           = "BP-VNET-DEV-S1-1"
  CC             = "BP_DEV_Vnet"
  CC-Project     = "BP_DEV"
  Customer-Code  = "BP"
  Environment    = "DEV"
  Project        = "ClientProject"
}

exclude_subnets_aks = ["subnet2"]
exclude_subnets_monolithic = []