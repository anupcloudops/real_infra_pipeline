
resource "azurerm_key_vault" "kvblock" {
  for_each = var.keyvolt
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.rgname
  rbac_authorization_enabled  = each.value.rbac_authorization_enabled
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled

  sku_name = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

      key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "userblock" {
  for_each = var.secrets
  name         = "${each.key}-user"
  value        = var.secrets[each.key].username
  key_vault_id = azurerm_key_vault.kvblock["kv1"].id
}
resource "azurerm_key_vault_secret" "passblock" {
  for_each = var.secrets
  name         = "${each.key}-pass"
  value        =  var.secrets[each.key].password
  key_vault_id = azurerm_key_vault.kvblock["kv1"].id
}

