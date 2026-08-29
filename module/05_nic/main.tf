resource "azurerm_network_interface" "nicblock" {
  for_each = var.nics
  name = each.value.name
  location = each.value.location
  resource_group_name = each.value.rgname
  ip_configuration {
    name = each.value.icname
    subnet_id = data.azurerm_subnet.datasub[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id = each.value.pipname !=null ? data.azurerm_public_ip.datapip[each.key].id : null
  }
}