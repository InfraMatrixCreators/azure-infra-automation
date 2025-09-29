resource "azurerm_resource_group" "rg_name" {
  name     = "rg-terraform-demo"
  location = "Australia East"
}
resource "azurerm_storage_account" "st_name" {
  name                     = "sttestlogswus01"
  resource_group_name      = azurerm_resource_group.rg_name.name
  location                 = azurerm_resource_group.rg_name.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
resource "azurerm_storage_container" "container_name" {
  name                  = "worker-test-01"
  storage_account_id    = azurerm_storage_account.st_name.id
  container_access_type = "private"
}
