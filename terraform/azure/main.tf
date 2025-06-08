provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "openshift" {
  name     = "rg-openshift"
  location = "East US"
}
