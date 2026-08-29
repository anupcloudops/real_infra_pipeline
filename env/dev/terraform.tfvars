# rgs = {
#     rg1 = {
#         name = "dev"
#         location = "central India"
#     }
#      rg2 = {
#         name = "prod"
#         location = "south India"
#     }
# }
# vnets = {
#     vnet1 ={
#         name = "devnet"
#         location = "central India"
#         rgname = "dev"
#         address_space = ["10.0.0.0/16"]
#     }
#         vnet2 ={
#         name = "prodnet"
#         location = "south India"
#         rgname = "prod"
#         address_space = ["10.1.0.0/16"]
#     }
# }
# subnets = {
#     vm = {
#         name = "vm1subnet"
#         vnetname = "devnet"
#         rgname = "dev"
#         address_prefixes = ["10.0.0.0/26"]
#     }
#         bastion = {
#         name = "AzureBastionSubnet"
#         vnetname = "prodnet"
#         rgname = "prod"
#         address_prefixes = ["10.0.0.64/26"]
#     }
# }
# pips = {
#     vm = {
#         name = "vmpip"
#        location = "central India"
#         rgname = "dev"
#         allocation_method = "Static"
#         sku = "Standard"
#     }
#         bastion = {
#         name = "bastionpip"
#        location = "south India"
#         rgname = "prod"
#         allocation_method = "Static"
#         sku = "Standard"
#     }
# }
# nics = {
#     vm = {
#         name = "publicnic"
#        subname = "vm1subnet"
#        icname = "vmic"
#         vnetname = "devnet"
#         rgname = "dev"
#         location = "central India"
#         pipname = "vmpip"
#         private_ip_address_allocation = "Dynamic"
#     }
#        vm1 = {
#         name = "pvtnic"
#        subname = "vm1subnet"
#        icname = "pvtic"
#         vnetname = "devnet"
#         rgname = "dev"
#         location = "central India"
#         pipname = null
#         private_ip_address_allocation = "Dynamic"
#     }
# }
# nsgs = {
#     nsg1 = {
#         name = "devnsg"
#             rgname = "dev"
#         location = "central India"
    
#     rule = [
#         {
#             name = "ssh"
#             direction = "Inbound"
#             access = "Allow"
#             protocol = "Tcp"
#             priority = "250"
#            source_address_prefix = "*"
# destination_address_prefix = "*"
# source_port_range = "*"
# destination_port_range =  "22"
#         },
#         {
#             name = "http"
#             direction = "Inbound"
#             access = "Allow"
#             protocol = "Tcp"
#             priority = "250"
#            source_address_prefix = "*"
# destination_address_prefix = "*"
# source_port_range = "*"
# destination_port_range =  "80"
#         }
#     ]
# }
# }
# association = {
#     vm1 = {
#        nicname = "publicnic"
#        nsgname = "devnsg"
#        rgname = "dev"
#     }
#     vm2 = {
#        nicname = "pvtnic"
#        nsgname = "devnsg"
#        rgname = "dev"
#     }
# }
# keyvolt = {
# kv1 = {
#     name = "anup-dev-kv-20260826"
#             rgname = "dev"
#         location = "central India"
#         rbac_authorization_enabled  = false
#   enabled_for_disk_encryption = true
#   soft_delete_retention_days  = 7
#   purge_protection_enabled    = false
#   sku_name = "standard"
# }
# }
# secrets =  {
#     vm = {
#         name = "vm"
#     }
#     vm1 = {
#         name = "vm1"
#     }
# }
# vms = {
#     vm1 ={
#         name = "pubvm"
#          rgname = "dev"
#         location = "central India"
#         disable_password_authentication = false
#         caching = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#         publisher = "canonical"
#         offer = "0001-com-ubuntu-server-jammy"
#         version = "22_04-lts-gen2"
#         sku = "latest"
#         nicname = "publicnic"
#         size = "Standard_Dc1s_v3"
#         username_secret_name            = "vm-user"
#     password_secret_name            = "vm-pass"
#     }
#         vm2 ={
#         name = "pvtvm"
#          rgname = "dev"
#         location = "central India"
#         disable_password_authentication = false
#         caching = "ReadWrite"
#         storage_account_type = "Standard_LRS"
#         publisher = "canonical"
#         offer = "0001-com-ubuntu-server-jammy"
#         version = "22_04-lts-gen2"
#         sku = "latest"
#         nicname = "pvtnic"
#         size = "Standard_Dc1s_v3"
#         username_secret_name            = "vm1-user"
#     password_secret_name            = "vm1-pass"
#     }
# }