# * * * * * * * * * * * *
# Project Constants
location = "AustraliaEast"

# * * * * * * * * * * * *
# Resource Group

environment                = "Test Environment"
vnet-address-space         = ["10.1.0.0/16"]
vnet-subnet-address        = ["10.1.0.0/24"]
firewall_allocation_method = "Static" # When the sku is default 'Basic',  allocation method 'Dynamic' works but for 'Standard', it has to be a 'Static'
firewall_sku               = "Standard"

admin_username = "" #Use your own credentials and be mindful of pushing them in to the Repo
admin_password = "" #Use your own credentials and be mindful of pushing them in to the Repo