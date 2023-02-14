
output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}
output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "snet_id" {
  value = azurerm_subnet.snet.id
}
output "snet_name" {
  value = azurerm_subnet.snet.name
}
output "snet_address_prefixes" {
  value = azurerm_subnet.snet.address_prefixes
}
