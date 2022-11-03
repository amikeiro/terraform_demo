# Main file to run the infrustructure from different modules (components)

# Manages a Resource Group.
resource "azurerm_resource_group" "this" {
  #name     = "${var.office_region}${var.office}${var.customer}-rg-${var.project}-${var.environment}"
  name     = "${var.office}${var.customer}-rg-${var.project}-${var.environment}"
  location = var.region
  tags     = var.common_tags
}

#>>>>>>>>>>>>>>>>>>> Network <<<<<<<<<<<<<<<<<<<<<
module "network" {
  source = "../Modules/Network"
  resource_group_name = azurerm_resource_group.this.name
  region = var.region
  project = var.project
  environment = var.environment
  vnet_address_space = var.vnet_address_space
  subnet_address_space = var.subnet_address_space
  tags = var.common_tags
}

#>>>>>>>>>>>>>>>>>>> Monitoring (Log Analytics (Workspace)) <<<<<<<<<<<<<<<<<<<<<
module "monitoring" {
  source = "../Modules/Monitoring"
  resource_group_name = azurerm_resource_group.this.name
  region = var.region
  project = var.project
  environment = var.environment
  tags = var.common_tags
}