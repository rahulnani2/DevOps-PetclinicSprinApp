data "azuread_client_config" "azclconfig01" {
}

resource "azuread_application" "azapp01" {
   display_name = var.service_principal_name
   owners = [ data.azuread_client_config.azclconfig01.object_id]
}

resource "time_sleep" "wait_for_application" { 
  depends_on = [azuread_application.azapp01]
  create_duration = "60s"
}

resource "azuread_service_principal" "azadsp01" {
   depends_on=[time_sleep.wait_for_application]
   app_role_assignment_required = true
   client_id = azuread_application.azapp01.client_id
   owners = [ data.azuread_client_config.azclconfig01.object_id ]
}

resource "azuread_service_principal_password" "azadsppasswd01" {
  depends_on=[azuread_application.azapp01, azuread_service_principal.azadsp01]
  service_principal_id = azuread_service_principal.azadsp01.id
}
