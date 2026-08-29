variable "rgs" {}
variable "vnets" {}
variable "subnets" {}
variable "pips" {}
variable "nics" {}
variable "nsgs" {}
variable "association" {}
variable "keyvolt" {}

variable "vms" {}
variable "secrets" {
  sensitive = true

  type = map(object({
    username = string
    password = string
  }))
}
