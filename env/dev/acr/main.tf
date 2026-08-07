module "acr" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-acr?ref=azure"

  acr_name                      = local.acr_name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  sku                           = var.sku
  admin_enabled                 = var.admin_enabled
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  georeplications               = var.georeplications
}
