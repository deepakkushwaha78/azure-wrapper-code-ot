locals {
  # Generate name according to client requirement: <CustCode>-VNG-<Env>-S1-1
  vng_name = "${var.customer_code}-VNG-${var.environment}-S1-1"
}
