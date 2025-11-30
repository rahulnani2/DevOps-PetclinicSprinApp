variable "prefix" {
  type = string
  default = "dev-petclinic"
}

locals {
  requiredTags ={
    "env" = "dev"
    "project" = "petclinic"
    "managed_by" = "terraform"
  }
}

variable "subscription_id" {
  type = string
  description = "Enter the subscription id of the Azure subscription"
}

variable "aksnodepool_subnet" {
  type = string
  default = "aks-nodepool-subnet"
}