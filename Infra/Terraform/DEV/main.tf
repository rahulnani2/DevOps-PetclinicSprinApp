resource "azurerm_resource_group" "pgrg01" {
  name = "${var.prefix}-rg01"
  location = "canadacentral"
  tags = local.requiredTags 
 }

module "networkModule" {
   source = "../modules/networking"
   resource_group_name = azurerm_resource_group.pgrg01.name
   location = azurerm_resource_group.pgrg01.location
   vnet_name = "dev-petclinic-vnet01"
   vnet_address_space = [ "192.168.0.0/16"]
   subnets = {
    aks-nodepool-subnet = {
         name = "aks-nodepool-sub01"
         address_prefix = "192.168.10.0/24"
        }
     }
    network_security_group_name = "petclinic-nsg-01"
    security_rules =  {
        "nsgrule-01" = {
            name                = "Allow-SSH"
            priority            = 100
            direction           = "Inbound"
            access              = "Allow"
            protocol            = "Tcp"
            source_port_range   = "*"
            destination_port_range = "*"
            source_address_prefix  = "*"
            destination_address_prefix = "*"
        }
    } 
  }    
output "network_details" {
    value = module.networkModule.subnet_id
}

module "ServicePrinicpal01" {
   source = "../modules/ServicePrincipal"
    service_principal_name = "dev-petclinic-sp01"
}

module "petclinicacr" {
  depends_on = [module.ServicePrinicpal01]
   source = "../modules/acr"
   acr_name = "petclinicimages"
   resource_group_name = azurerm_resource_group.pgrg01.name
   location = azurerm_resource_group.pgrg01.location
} 

resource "azurerm_role_assignment" "azacrpullrole" {
  depends_on = [module.ServicePrinicpal01, module.petclinicacr]
  scope = module.petclinicacr.acr_id
  role_definition_name = "AcrPull"
  principal_id = module.ServicePrinicpal01.service_principal_objectid
}

module "AKSCluster01" {
   depends_on = [ module.networkModule, module.petclinicacr, module.ServicePrinicpal01 ]
   
   source = "../modules/aks"
   resource_group_name = azurerm_resource_group.pgrg01.name
   location = azurerm_resource_group.pgrg01.location
   cluster_name = "dev-petclinic-aks-clu01"
   kubernetes_version = "1.33.5"
   aks_subnet_id = module.networkModule.subnet_id[var.aksnodepool_subnet]
   tags = local.requiredTags
   service_principle_name = module.ServicePrinicpal01.service_principle_name
   client_id = module.ServicePrinicpal01.client_id
   client_secret = module.ServicePrinicpal01.client_secret
} 

resource "local_file" "kubeconfig" {
  filename = "./kubecofnig"
  content = module.AKSCluster01.config
}



