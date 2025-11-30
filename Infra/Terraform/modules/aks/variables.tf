variable "resource_group_name" {
  type = string
  default = "Provide the resource group name to create cluster"
} 

variable "location" {
   type = string
   default = "Provide the location name to deploy the cluster"
} 

variable "cluster_name" {
   type = string
   default = "Provide the cluster name"
} 

variable "node_count" {
    type = number
    description = "No of nodes to be deployed to node pool"
    default = 1
} 

variable "vm_size" { 
   type = string
   description = "VM Size for the Node pool deployment"
   default = "Standard_B4ms"
} 

variable "kubernetes_version" {
    type =string
    description = "Kubernetes version type to use in AKS Cluster"
}

variable "aks_subnet_id" {
  type = string
  description = "Subnet for the AKS node pool creation"
}

variable "tags" {
  type = map(string)
  description = "Required tags for the Kubernetes cluster creation"
}

variable "service_principle_name" {
  type = string
  description = "Name of the service prinicipal to be addigned to the cluster "
}  

variable "client_id" {
  
}

variable "client_secret" {
  sensitive = true
  type = string
}


# variable "azureacr_id" {
#   type = string
#   description = "Azure ACR ID to attached to AKS cluster"
# }