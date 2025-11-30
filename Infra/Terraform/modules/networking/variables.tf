variable "resource_group_name" {
  type = string
  description = "The name of the existing resource group for the vNet to be created"
} 

variable "location" {
  type =string
  description = "Location of the resources to be created"
}

variable "vnet_address_space" {
  type = list(string)
  description = "Address Space to be added to the created vnet"
} 

variable "vnet_name" {
  type = string
  description = "Name of the vNet to be created"
}

variable "subnets" {
  description = "A map of subnets to create within the vnet"
  type = map(object({
    name = string
    address_prefix = string
  }))
}

 variable "network_security_group_name" {
  type = string
  description = "Name of the Network security group"
}

variable "security_rules" {
   type = map(object({
     name = string
     priority = number
     direction = string
     access = string
     protocol = string
     source_port_range = string
     destination_port_range = string
     source_address_prefix = string
     destination_address_prefix = string
   }))
}
