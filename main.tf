terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~> 4.0"
        }
    }
}



provider "azurerm" {
 features {}
 subscription_id = "e2aca932-c2ba-42e6-b650-561760b0f03b"
 }

# Create a resource group
resource "azurerm_resource_group" "GT-GRP" {
    name = "GT-GRP"
    location = "West Europe"

tags = {
    key = "production"
  }
}

resource "azurerm_virtual_network" "terraVnet" {
  name                = "terraVnet"
  location            = azurerm_resource_group.GT-GRP.location
  resource_group_name = azurerm_resource_group.GT-GRP.name
  address_space       = ["10.0.0.0/16"]
}