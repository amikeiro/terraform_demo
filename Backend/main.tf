# Main file to run the infrustructure from different modules (components)

resource "azurerm_resource_group" "this" {
  name     = "${var.office_region}${var.office}${var.customer}-rg-${var.project}-${var.environment}"
  location = var.region
  tags     = var.common_tags
}

#>>>>>>>>>>>>>>>>>>> Common Data Objects <<<<<<<<<<<<<<<<<<<<<

provider "azurerm" {
  alias           = "Atea-Sandbox-NO"
  subscription_id = "68aa0317-df02-493d-b9c7-0fa97a84fde6"
  features {}
}

