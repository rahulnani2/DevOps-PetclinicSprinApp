output "client_certificate" {
   sensitive = true
   value = azurerm_kubernetes_cluster.azaksclu01.kube_config[0].client_certificate
} 

output "aks_cluster_id" {
    value = azurerm_kubernetes_cluster.azaksclu01.id
    description = "Aks clsuter ID"
    
    }

output "config" {
value = azurerm_kubernetes_cluster.azaksclu01.kube_config_raw
}