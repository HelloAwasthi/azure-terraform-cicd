terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }

  # Remote State Backend (Reusing the Azure Storage Account from Project 2)
  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "akshat777" # Change this to your unique storage account name!
    container_name       = "tfstate"
    key                  = "project3-oidc.tfstate"    # Separate state key for Project 3
  }
}

provider "azurerm" {
  features {}
  # No client_secret needed here! 
  # Terraform automatically reads ARM_USE_OIDC and ARM_* environment variables set in GitHub Actions.
}

# The Resource Group to be managed via OIDC
resource "azurerm_resource_group" "project3_rg" {
  name     = "oidc-secured-rg"
  location = "East US"

  tags = {
    Environment = "Learning"
    Project     = "Project-3-OIDC"
    ManagedBy   = "GitHub-Actions-OIDC"
  }
}