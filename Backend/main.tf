# Main file to run the infrustructure from different modules (components)

# Manages a Resource Group.
resource "azurerm_resource_group" "this" {
  #name     = "${var.office_region}${var.office}${var.customer}-rg-${var.project}-${var.environment}"
  name     = "${var.office}${var.customer}-rg-${var.project}-${var.environment}"
  location = var.region
  tags     = var.common_tags
}

#>>>>>>>>>>>>>>>>>>> Common data objects <<<<<<<<<<<<<<<<<<<<<

data "azurerm_client_config" "current" {
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

#>>>>>>>>>>>>>>>>>>> KeyVault <<<<<<<<<<<<<<<<<<<<<

module "keyvault" {
  source = "../modules/keyvault"
  resource_group_name = azurerm_resource_group.this.name
  office_region = var.office_region
  office = var.office
  customer = var.customer
  region = var.region
  project = var.project
  environment = var.environment
  tenant_id = data.azurerm_client_config.current.tenant_id
  object_id = data.azurerm_client_config.current.object_id
  private_endpoint_subnet_id = module.network.default_subnet
  allowed_subnets = [
    module.network.default_subnet
  ]
  log_analytics_workspace_id = module.monitoring.workspace_id
  allowed_ips = var.ip_allow_list
  tags = var.common_tags
}