output "vnet_id" {
  description = "The ID of Virtual_Network"
  value = azurerm_virtual_network.azvnet01.id
}

output "subnet_id" {
  description = "The ID's of the Subnets created"
  value = {for k, v in azurerm_subnet.azsubnet01 : k => v.id }
} 

# output "security_rules" { 
#     description = "The ID's of subscription ID's"
#     value = {for k , v in azurerm_network_security_group.aznsg01 : k => v.id}

# }