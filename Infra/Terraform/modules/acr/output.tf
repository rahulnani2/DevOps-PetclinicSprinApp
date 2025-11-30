output "acr_id" {
  description = "Azure container registry ID"
  value = azurerm_container_registry.azacr01.id
}

output "acr_login_server" {
  description = "ACR login server"
  value = azurerm_container_registry.azacr01.login_server
  }