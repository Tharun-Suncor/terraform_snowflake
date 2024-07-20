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
    resource_group_name  = var.resource_group_name
    storage_account_name = var.storage_account_name
    container_name       = var.container_name
    key                  = var.state_file_name
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


module "snowflake_warehouse" {
  source = "./modules/snowflake_warehouse"

  name                 = "my_warehouse"
  comment              = "This is my warehouse"
  size                 = "X-SMALL"
  auto_suspend         = 60
  auto_resume          = true
  initially_suspended  = true
}

