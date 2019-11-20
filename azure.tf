# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=1.36.1"
}

data "azurerm_location" "ngc" {
  primary_location   = "North Europe"
  secondary_location = "West Europe"
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
  location            = data.azurerm_location.ngc.primary_location
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

resource "azurerm_cosmosdb_account" "ngc" {
  name                = "nextgenconf"
  location            = azurerm_resource_group.ngc.location
  resource_group_name = azurerm_resource_group.ngc.name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 10
    max_staleness_prefix    = 200
  }

  geo_location {
    location          = data.azurerm_location.ngc.secondary_location
    failover_priority = 1
  }
}

resource "azurerm_cosmosdb_sessions_mongo_database" "ngc" {
  name                = "SessionsDb"
  resource_group_name = azurerm_resource_group.ngc.name
  account_name        = azurerm_cosmosdb_account.ngc.name
}

resource "azurerm_cosmosdb_mongo_collection" "example" {
  name                = "Sessions"
  resource_group_name = azurerm_resource_group.ngc.name
  account_name        = azurerm_cosmosdb_account.ngc.name
  database_name       = azurerm_cosmosdb_sessions_mongo_database.ngc.name

  default_ttl_seconds = "-1"
  shard_key           = "_id"
}
