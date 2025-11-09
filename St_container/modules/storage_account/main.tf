resource "azurerm_storage_account" "st_test" {
    for_each = var.st_test
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type

  tags = {
    environment = "dev"
  }
}
output "st_test_id" {
    value = {for k, st in azurerm_storage_account.st_test : k => st.id}
    description = "storage_id"
  
}