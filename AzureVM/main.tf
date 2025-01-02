resource "azurerm_resource_group" "rg" {
  location = var.azurerm_resource_group_location
  name     = var.azurerm_resource_group_name
}