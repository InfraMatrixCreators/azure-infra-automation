module "rg" {
  source = "../../modules/resource_group"
  rg_new = var.rg_new

}
module "st" {
  depends_on = [module.rg]
  source     = "../../modules/storage_account"
  st_test    = var.st_test
}
