locals {
  # Generate name according to client requirement: <CustCode>-LNG-<Env>-S1-1
  local_network_gateway_name = "${var.customer_code}-LNG-${var.environment}-S1-1"
  
  # Common tags
  common_tags = {
    Name          = local.local_network_gateway_name
    CC            = "${var.customer_code}_${var.environment}_LNG"
    "CC-Project"  = "${var.customer_code}_${var.environment}"
    "Customer-Code" = var.customer_code
    Environment   = var.environment
    Project       = "ClientProject"
  }
}