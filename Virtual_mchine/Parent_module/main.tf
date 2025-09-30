module "resource_group" {
  source      = "../Child_module/Resource_group"
  rg_name     = "Dev_rg"
  rg_location = "Australia East"
}
module "virtual_network" {
  source             = "../Child_module/Virtual_network"
  depends_on         = [module.resource_group]
  rg_name            = "Dev_rg"
  rg_location        = "Australia East"
  vnet_name          = "Dev_vnet"
  vnet_address_space = ["10.0.0.0/16"]

}
module "subnet" {
  source                  = "../Child_module/Subnet"
  depends_on              = [module.virtual_network]
  rg_name                 = "Dev_rg"
  vnet_name               = "Dev_vnet"
  subnet_name             = "Dev_subnet"
  subnet_address_prefixes = ["10.0.1.0/24"]

}
module "public_ip" {
  source         = "../Child_module/Public_ip"
  depends_on     = [module.resource_group]
  rg_name        = "Dev_rg"
  rg_location    = "Australia East"
  public_ip_name = "vm1pip"

}
module "network_interface_card" {
  source         = "../Child_module/Network_Interface_card"
  depends_on     = [module.subnet, module.public_ip]
  rg_name        = "Dev_rg"
  vnet_name      = "Dev_vnet"
  subnet_name    = "Dev_subnet"
  public_ip_name = "vm1pip"
  nic_name       = "vm1nic"
  rg_location    = "Australia East"

}
module "virtual_machine" {
  source          = "../Child_module/Virtual_machine"
  depends_on      = [module.network_interface_card]
  rg_name         = "Dev_rg"
  nic_name        = "vm1nic"
  vm_name         = "vm1"
  vm_size         = "Standard_B1s"
  admin_username  = "azureuser"
  admin_password  = "Password@1234"
  rg_location     = "Australia East"
  image_publisher = "Canonical"
  image_offer     = "0001-com-ubuntu-server-jammy"
  image_sku       = "22_04-lts"
}
module "network_security_group" {
  source      = "../Child_module/Networ_security_group"
  depends_on  = [module.network_interface_card]
  rg_name     = "Dev_rg"
  rg_location = "Australia East"
  nsg_name    = "vm1nsg"
  nic_name    = "vm1nic"

}