# resource "azurerm_resource_group" "rg_name" {
#   name     = "rg-terraform-demo"
#   location = "Australia East"
# }
# resource "azurerm_storage_account" "st_name" {
#   name                     = "sttestlogswus01"
#   resource_group_name      = azurerm_resource_group.rg_name.name
#   location                 = azurerm_resource_group.rg_name.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }