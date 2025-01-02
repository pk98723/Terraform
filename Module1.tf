module "AzureVM" {
    source = "./AzureVM"
    azurerm_resource_group_location = "westeurope"
    azurerm_resource_group_name = "win-rg-pavan"
}

