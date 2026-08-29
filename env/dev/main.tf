module "rg" {
  source = "../../module/01_rg"
  rgs = var.rgs
}
module "vnet" {
  depends_on = [ module.rg ]
  source = "../../module/02_vnet"
  vnets = var.vnets
}
module "subnet" {
  depends_on = [ module.vnet ]
  source = "../../module/03_subnet"
  subnets = var.subnets
}
module "pip" {
  depends_on = [ module.rg ]
  source = "../../module/04_pip"
  pips = var.pips
}
module "nic" {
  depends_on = [ module.pip,module.subnet ]
  source = "../../module/05_nic"
  nics = var.nics
}
module "nsg" {
  depends_on = [ module.rg ]
  source = "../../module/06_nsg"
  nsgs = var.nsgs
}
module "association" {
  depends_on = [ module.nic, module.nsg ]
  source = "../../module/07_association"
  association = var.association
}
module "keyvault" {
  depends_on = [ module.rg ]
  source = "../../module/08_keyvault"
  keyvolt = var.keyvolt
  secrets = var.secrets
}
module "vm" {
  depends_on = [ module.nic, module.keyvault ]
  source = "../../module/09_vm"
  vms = var.vms
kvname = var.keyvolt["kv1"].name
kvrgname = var.keyvolt["kv1"].rgname
}