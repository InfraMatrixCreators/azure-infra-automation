data "azurerm_subnet" "subnetdata" {
  name                 = var.subnet_name
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
  
}
data "azurerm_public_ip" "publicipdata" {
  name                = var.public_ip_name
  resource_group_name = var.rg_name
  
}