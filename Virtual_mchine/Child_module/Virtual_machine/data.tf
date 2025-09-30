data "azurerm_network_interface" "nicdata" {
  name                = var.nic_name
  resource_group_name = var.rg_name
  
}