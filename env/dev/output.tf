output "rg" {
    value = module.rg      
    }
    output "public" {
    value = module.pip
    }
    output "private_ip" {
    value = module.nic
}
output "vm_password" {
  value = module.keyvault
  sensitive = true
}