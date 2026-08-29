resource "azurerm_linux_virtual_machine" "pubvm" {
    for_each = var.vms
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.rgname
    size = each.value.size
    admin_username = data.azurerm_key_vault_secret.datauser[each.key].value
    admin_password = data.azurerm_key_vault_secret.datapass[each.key].value
    disable_password_authentication = each.value.disable_password_authentication
    network_interface_ids = [data.azurerm_network_interface.datanic[each.key].id]
    os_disk{
        caching =each.value.caching
        storage_account_type = each.value.storage_account_type
    }
    source_image_reference {
         publisher = each.value.publisher
        offer = each.value.offer
        version = each.value.version
        sku = each.value.sku
    }
    custom_data = filebase64 ("${path.module}/script.sh")
}