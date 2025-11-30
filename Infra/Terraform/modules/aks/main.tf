resource "azurerm_kubernetes_cluster" "azaksclu01" {
  name = var.cluster_name
  location = var.location
  resource_group_name = var.resource_group_name
  dns_prefix = "${var.resource_group_name}-aks-clu01"
  kubernetes_version = var.kubernetes_version
  default_node_pool {
        name = "pcakspool01"
        node_count  = var.node_count
        vm_size = var.vm_size
        vnet_subnet_id = var.aks_subnet_id
        }
  service_principal {    
    client_id = var.client_id 
    client_secret = var.client_secret
     }     
  tags = var.tags     

   network_profile {
     network_plugin = "azure"
     load_balancer_sku = "standard"
   }
  

}