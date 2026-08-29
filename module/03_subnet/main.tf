resource "azurerm_subnet" "subnetblock" {
    for_each = var.subnets
    name = each.value.name
    virtual_network_name = each.value.vnetname
    resource_group_name = each.value.rgname
    address_prefixes = each.value.address_prefixes
  
}