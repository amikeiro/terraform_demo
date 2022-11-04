output "default_subnet" {
  value = azurerm_subnet.subnet_innsikt.id
  description = "ID of the default subnet of the vnet"
}