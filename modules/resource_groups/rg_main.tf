# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
#   Resource Group
# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
# Create a Resource Group
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = "rg"

  tags = {
    environment = var.environment
    name        = "Test Resource Group"
  }
}