resource "azurerm_resource_group" "rgblock1"{
    for_each = { for key ,value in var.rgs : key => value if upper(value.location) == "CENTRIAL INDIA" }
    name = each.value.name
    location  = each.value.location
    lifecycle {
      prevent_destroy = true
    }
}
resource "azurerm_resource_group" "rgblock2"{
    for_each = { for key ,value in var.rgs : key => value if upper(value.location) != "CENTRIAL INDIA" }
    name = each.value.name
    location  = each.value.location
    lifecycle {
      prevent_destroy = false
    }
}