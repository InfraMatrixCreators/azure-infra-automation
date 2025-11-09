resource "azurerm_resource_group" "rg_test" {
  for_each = var.rg_new
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}

output "rg_test_id" {
    value = azurerm_resource_group.rg_test["rg1"].id
    description = "id of resource group"
  
}




    