resource "azurerm_public_ip" "vm1pip" {
  name                = var.public_ip_name
  location            = var.rg_location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"
  
}