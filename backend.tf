terraform {
  backend "azurerm" {
    resource_group_name  = "rgtfstatefiles"
    storage_account_name = "tfstatestorageaccountone"
    container_name       = "tfstate-container"
    key                  = "Pre-requisite.terraform.tfstate"
  }
}