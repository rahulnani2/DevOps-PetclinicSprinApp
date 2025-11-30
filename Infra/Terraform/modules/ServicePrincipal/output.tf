output "service_principle_name" {
  description = "The Object_id of a servicepricipal name"
  value = azuread_service_principal.azadsp01.display_name
} 

output "service_principal_objectid" {
   description = "ServicePricipal Object_ID"
   value = azuread_service_principal.azadsp01.object_id
} 

output "service_principal_tenantid" {
  description = "ServicePrinicpal Tenant_id "
  value = azuread_service_principal.azadsp01.application_tenant_id
} 

output "client_id" {
   description = "Application ID of AzureAD "
   value = azuread_application.azapp01.client_id
} 

output "client_secret" {
   description = "Service Prinicpal Secret"
   value = azuread_service_principal_password.azadsppasswd01.value
}