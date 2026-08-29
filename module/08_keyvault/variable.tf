variable "keyvolt" {}
variable "secrets" {
  sensitive = true

  type = map(object({
    username = string
    password = string
  }))
}