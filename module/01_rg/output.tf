output "rgname" {
  value = merge({
    for k,v in azurerm_resource_group.rgblock1: k=>v.name
  },
  {
    for k,v in azurerm_resource_group.rgblock2: k=>v.name
  })
}