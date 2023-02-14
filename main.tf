resource "time_sleep" "wait_30_seconds" {
  create_duration = "30s"
}

# # * * * * * * *  module resource_groups is used to build Resource Groups [Primary and Secondary] * * * * * * *
module "resource_groups" {
  source      = "./modules/resource_groups"
  location    = var.location
  environment = var.environment
  depends_on = [
    time_sleep.wait_30_seconds
  ]
}

# # * * * * * * *  module virtual_networks is used for creating vnets in each Resource Group * * * * * * *
module "virtual_networks" {
  source                     = "./modules/virtual_networks"
  location                   = var.location
  environment                = var.environment
  rg_name                    = module.resource_groups.rg_name
  firewall_allocation_method = var.firewall_allocation_method
  firewall_sku               = var.firewall_sku
  vnet-address-space         = var.vnet-address-space
  vnet-subnet-address        = var.vnet-subnet-address
  depends_on                 = [module.resource_groups, time_sleep.wait_30_seconds]
}

module "virtual_machine" {

  source                = "./modules/virtual_machine"
  resource_group_name   = module.resource_groups.rg_name
  location              = var.location
  environment           = var.environment
  virtual_network_name  = module.virtual_networks.vnet_name
  subnet_name           = module.virtual_networks.snet_name
  subnet_id             = module.virtual_networks.snet_id
  snet_address_prefixes = module.virtual_networks.snet_address_prefixes

  # This module support multiple Pre-Defined Linux and Windows Distributions.
  # Windows Images: windows2012r2dc, windows2016dc, windows2019dc
  virtual_machine_name               = "vm-testdc"
  windows_distribution_name          = "windows2019dc"
  virtual_machine_size               = "Standard_A2_v2"
  admin_username                     = var.admin_username
  admin_password                     = var.admin_password
  private_ip_address_allocation_type = "Static"
  private_ip_address                 = ["10.1.0.4"]

  # Active Directory domain and netbios details
  # Intended for test/demo purposes
  # For production use of this module, update the security by adding correct nsg rules
  active_directory_domain       = "consoto.com"
  active_directory_netbios_name = "CONSOTO"

  # Network Seurity group port allow definitions for each Virtual Machine
  # NSG association to be added automatically for all network interfaces.
  # SSH port 22 and 3389 is exposed to the Internet recommended for only testing.
  # For production environments, we recommend using a VPN or private connection
  nsg_inbound_rules = [
    {
      name                   = "rdp"
      destination_port_range = "3389"
      source_address_prefix  = "*"
    },

    {
      name                   = "dns"
      destination_port_range = "53"
      source_address_prefix  = "*"
    },
  ]

  # Adding TAG's to your Azure resources (Required)
  # ProjectName and Env are already declared above, to use them here, create a varible.
  tags = {
    ProjectName  = "demo-AD-internal"
    Owner        = "user@example.com"
    BusinessUnit = "CORP"
    ServiceClass = "Gold"
  }
}