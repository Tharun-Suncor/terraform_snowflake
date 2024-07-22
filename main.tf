terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_sf_terraform_backend"
    storage_account_name = "saterraformbackend22"
    container_name       = "terrafornstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

provider "snowflake" {
  account     = var.snowflake_account
  username    = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}

# Snowflake warehouse

module "snowflake_warehouse" {
  source = "./modules/snowflake_warehouse"

  name                 = "my_warehouse"
  comment              = "This is my warehouse"
  size                 = "X-SMALL"
  auto_suspend         = 60
  auto_resume          = true
  initially_suspended  = true
}

# Snowflake database

module "snowflake_database" {
  source = "./modules/snowflake_database"
  name                 = "my_database"
  comment              = "Sample database"
}