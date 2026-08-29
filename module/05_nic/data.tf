data "azurerm_subnet" "datasub" {
  for_each = var.nics
name = each.value.subname
virtual_network_name = each.value.vnetname
resource_group_name = each.value.rgname
}
data "azurerm_public_ip" "datapip" {
  for_each = { for k,v in var.nics :k=>v if v.pipname != null }
  name = each.value.pipname
  resource_group_name = each.value.rgname
}