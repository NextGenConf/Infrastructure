# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.36.1"
}

resource "azurerm_resource_group" "ngc" {
  name     = "ngc"
  location = "North Europe"
}

resource "azurerm_container_registry" "ngc" {
  name                = "NextGenConf"
  sku                 = "Standard"
  admin_enabled       = false
  resource_group_name = azurerm_resource_group.ngc.name
  location            = azurerm_resource_group.ngc.location
}
