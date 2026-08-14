module "virtual_machine" {
  for_each                     = var.vms
  source                       = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-vm?ref=azure"
  vm_name                      = each.key
  resource_group_name          = data.azurerm_resource_group.rg.name
  location                     = var.location
  size                         = each.value.size
  admin_username               = each.value.admin_username
  admin_password               = each.value.admin_password
  subnet_id                    = data.azurerm_subnet.subnet[each.key].id
  nsg_id                       = each.value.nsg_name != null ? data.azurerm_network_security_group.nsg[each.key].id : null
  public_ip_id                 = each.value.create_public_ip ? azurerm_public_ip.pip[each.key].id : null
  os_disk_storage_account_type = each.value.os_disk_storage_account_type
  os_disk_size_gb              = each.value.os_disk_size_gb
  data_disks                   = each.value.data_disks
  image_publisher              = each.value.image_publisher
  image_offer                  = each.value.image_offer
  image_sku                    = each.value.image_sku
  image_version                = each.value.image_version
  os_type                      = each.value.os_type
  patch_mode                   = each.value.patch_mode
  patch_assessment_mode        = each.value.patch_assessment_mode
  plan_name                    = each.value.plan_name
  plan_product                 = each.value.plan_product
  plan_publisher               = each.value.plan_publisher
  zone                         = each.value.zone
  tags                         = each.value.tags
  enable_ip_forwarding         = each.value.enable_ip_forwarding
  firewall_route_name          = var.firewall_route_name
  route_tables                 = each.key == var.firewall_vm_name ? var.route_tables : {}
  firewall_nic_id              = each.key == var.firewall_vm_name ? "self" : null

  # Private disk access configuration
  public_network_access_enabled = each.value.public_network_access_enabled
  network_access_policy         = each.value.network_access_policy
}
