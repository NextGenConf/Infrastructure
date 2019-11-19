terraform {
  required_version = ">= 0.12.13"
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "ngcterraform"
    container_name       = "ngc-tfstate"
    key                  = "terraform.tfstate"
  }
}
