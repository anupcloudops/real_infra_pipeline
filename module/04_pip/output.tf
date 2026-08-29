output "public_ip" {
  value = {
    for k,v in azurerm_public_ip.pipblock : k=>v.ip_address
  }
}