locals {
  # Generate name according to client requirement: <clientcode>-VPN-<Env>-S1-1
  connection_name = "${var.customer_code}-VPN-${var.environment}-S1-1"
  lng_name        = "${var.customer_code}-LNG-${var.environment}-S1-1"
}
