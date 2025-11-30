terraform {
  backend azurerm {
    resource_group_name = "terraform-stfiles-rg01"
    storage_account_name = "devtfstatespetclinic"
    container_name = "terraformstaefiles"
    key = "dev-petclinicstatefile.tfstate"
  }
}