output "private_ip" {
    value = merge({
        for k, v in azurerm_network_interface.nicblock:k=>v.private_ip_address
    },
    {
        for k, v in azurerm_network_interface.nicblock:k=>v.id
    }
  )
}
output "icname" {
    value = {
        for k, v in azurerm_network_interface.nicblock:k=>v.ip_configuration[0].name
    }
}