variable "acr_name" {
  type = string
  description = "Provide the acr name"
} 

variable "resource_group_name" {
  type = string
  description = "Provide the resource group"
} 

variable "location" {
  type = string
  description = "Provide the name of the location"
} 

variable "acr_sku" {
  type = string
  default = "Standard"
  description = "SKU for the Azure Container Registry"
}

variable "admin_enabled" {
  description = "Admin user is enabled for the ACR"
  type = bool
  default = false
}