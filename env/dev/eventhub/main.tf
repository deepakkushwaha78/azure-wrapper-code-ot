locals {
  namespace_name = "kafka-${upper(var.clientcode)}-${lower(var.env)}"

  kafka_tags = merge(var.tags, {
    Name = local.namespace_name
  })
}

module "eventhub" {
  source = "git::https://github.com/ot-client/newgen_terraform.git//terraform-azure-eventhub?ref=azure"

  namespace_name               = local.namespace_name
  location                     = var.location
  resource_group_name          = data.azurerm_resource_group.rg.name
  sku                          = var.sku
  capacity                     = var.throughput_units
  local_authentication_enabled = var.local_authentication_enabled
  eventhub_name                = var.eventhub_name
  partition_count              = var.partition_count
  message_retention            = var.message_retention
  public_access_network_enable = var.public_access_network_enable

  tags = local.kafka_tags
}
