output "password" {
  value = {
    for k, v in random_password.vm_password : k=>v.result
  }
  sensitive = true
}