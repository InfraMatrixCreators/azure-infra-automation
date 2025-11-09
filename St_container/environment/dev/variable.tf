variable "rg_new" {

  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
    tags       = map(string)
  }))
}
variable "st_test" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))

}
