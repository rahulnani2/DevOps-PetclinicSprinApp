resource "azurerm_virtual_network" "azvnet01" {
  name = var.vnet_name
  location = var.location
  resource_group_name = var.resource_group_name
  address_space = var.vnet_address_space 
}

resource "azurerm_subnet" "azsubnet01" {
  for_each = var.subnets
  name = each.value.name
  resource_group_name = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes = [each.value.address_prefix]
}

resource "azurerm_network_security_group" "aznsg01" {
  name = var.network_security_group_name
  location = var.location
  resource_group_name = var.resource_group_name
    dynamic "security_rule" {
    for_each = var.security_rules
    content {
      name                        = security_rule.value.name
      priority                    = security_rule.value.priority
      direction                   = security_rule.value.direction
      access                      = security_rule.value.access
      protocol                    = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range    = security_rule.value.destination_port_range
      source_address_prefix    = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  } 
}