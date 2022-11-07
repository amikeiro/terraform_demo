# Configure the Azure provider
terraform {
  #backend "azurerm" {}

  # Version can be determined here or coded in a way to get the default (last version), or up to a specific version (see the documentaiton for more details)
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.9.0"
    }
  }
}
provider "azurerm" {
  features {}
}