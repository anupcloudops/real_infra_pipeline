data "azurerm_network_interface" "datanic" {
for_each = var.vms
name = each.value.nicname
resource_group_name = each.value.rgname
}
  
data "azurerm_key_vault" "datakv"{
  name = var.kvname
  resource_group_name = var.kvrgname
}
data "azurerm_key_vault_secret" "datauser"{
  for_each = var.vms
name = each.value.username_secret_name
key_vault_id = data.azurerm_key_vault.datakv.id
}

data "azurerm_key_vault_secret" "datapass" {
  for_each = var.vms
  name = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.datakv.id
}
