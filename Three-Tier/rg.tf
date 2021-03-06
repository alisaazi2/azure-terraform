variable "prefix" {
  default = "dev"
}

resource "azurerm_resource_group" "main" {
  name     = "${var.prefix}-resources"
  location = "West Europe"
}