resource "azurerm_resource_group" "rg_dev" {
    name = var.rg_name
    location = var.rg_location
}