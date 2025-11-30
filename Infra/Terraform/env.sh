# Azure Cli commands to create  | ResourceGroup | StorgaeAccount | Blob Container
# Create a Resource group
az group create --name $RESOURCE_GROUP_NAME --location eastus

# Create storage account 
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob

#Create blob container 
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME

# Azure Environment Configuration 
$env: ARM_CLIENT_ID = 
$env: ARM_CLIENT_SECRET = 
$env: ARM_SUBSCRIPTION_ID = 6e7256d2-7049-4f1c-a8a9-c31e1da9d40a
$env: ARM_TENANT_ID = 