terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "akshat777" # Use YOUR storage account name
    container_name       = "tfstate"
    key                  = "project2.tfstate" # The name of the memory file
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "project1_rg" {
  name     = "quality-gate-rg"
  location = "Central India"
}