resource "azurerm_key_vault" "kv" {
  name                       = local.kv_name
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.kv_sku
  enable_rbac_authorization  = true
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  tags                       = var.tags

  timeouts {
    create = "60m"
    update = "60m"
    read   = "30m"
  }
}