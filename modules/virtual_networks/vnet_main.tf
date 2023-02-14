# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   Resource Groups's Virtual Netowrk and LinuxVM ####
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
# Create a VNet
resource "azurerm_virtual_network" "vnet" {
  name                = "vnet"
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.vnet-address-space

  tags = {
    environment = var.environment
    "Network"   = "vnet"
  }
}

# Create a Subnet
resource "azurerm_subnet" "snet" {
  name                 = "snet"
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.vnet-subnet-address
}