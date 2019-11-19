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

variable "cluster_client_secret" {
  type = string
}

resource "azurerm_kubernetes_cluster" "ngc" {
  name                = "ngc"
  location            = azurerm_resource_group.ngc.location
  resource_group_name = azurerm_resource_group.ngc.name
  dns_prefix          = "ngc"

  agent_pool_profile {
    name    = "default"
    count   = "3"
    vm_size = "Standard_D2_v2"
    os_type = "Linux"
  }

  service_principal {
    client_id     = "5a6f663a-b005-4f4b-88af-ad504dbacd8b"
    client_secret = var.cluster_client_secret
  }
}
