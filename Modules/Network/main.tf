# This module contains the resources for network. In this module, there are primarily virtual networks and subnets here. The variables are defined in another file. 

# Manages a virtual network including any configured subnets. Each subnet can optionally be configured with a security group to be associated with the subnet.
resource "azurerm_virtual_network" "this" {
    name = "vnet-${var.project}-${var.environment}"
    location = var.region
    resource_group_name = var.resource_group_name
    address_space = var.vnet_address_space
}

# Manages a subnet. Subnets represent network segments within the IP space defined by the virtual network.
resource "azurerm_subnet" "subnet_innsikt" {
    name                                    = "snet-${var.project}-${var.environment}"
    virtual_network_name                    = azurerm_virtual_network.this.name 
    resource_group_name                     = var.resource_group_name 
    address_prefixes                        = var.subnet_address_space
    #snet_address_space                    = var.subnet_address_space

    enforce_private_link_endpoint_network_policies = true
    service_endpoints = [
        "Microsoft.KeyVault"
    ]
}