terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    snowsql = {
          source  = "aidanmelen/snowsql"
          version = ">= 1.3.3"  
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
  user        = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}
provider "snowsql" {
  account     = var.snowflake_account
  username        = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}


module "snowflake_warehouse" {
  source = "./modules/snowflake_warehouse"

  name                                  = "my_warehouse"
  comment                               = "This is my warehouse"
  size                                  = "LARGE"
  auto_suspend                          = 60
  auto_resume                           = true
  initially_suspended                   = true
  enable_query_acceleration             = false
  query_acceleration_max_scale_factor   = null
  warehouse_type                        = "STANDARD"
  max_concurrency_level                 = 8
  statement_queued_timeout_in_seconds   = 0
  statement_timeout_in_seconds          = 172800
}



module "snowflake_database" {
  source = "./modules/snowflake_database"

  name                        = "my_database"
  is_transient                = false
  comment                     = "This is my database"
  data_retention_time_in_days = 1
}


module "snowflake_role" {
  source = "./modules/snowflake_role"

  name                        = "role_1"
  comment                     = "Sample role"
}

module "snowflake_user" {
  source = "./modules/snowflake_user"

  name                    = "my_user"
  comment                 = "sample user"
  disabled                = false
  default_warehouse       = "my_warehouse"
  default_namespace       = ""
  default_role            = "SYSADMIN"
  rsa_public_key          = null
  rsa_public_key_2        = null
  must_change_password    = false
  password                = "my_password"
  email                   = "user@example.com"
  first_name              = "First"
  last_name               = "Last"
  default_secondary_roles = ["ALL"]
}

module "snowflake_grant_account_role" {
  source           = "./modules/snowflake_grants"
  
  role_name        = "role_1"
  user_name        = "my_user"
}

module "snowflake_schema" {
  source           = "./modules/snowflake_schema"
  
  database_name    = "my_database"
  schema_name      = "sample_schema"
  schema_comment   = "This is a sample schema for demonstration purposes."
  data_retention_days = -1
  is_managed = false
  is_transient = false
}
/*resource "snowflake_unsafe_execute" "test1" {
  execute = "CREATE DATABASE if not exists ABC"
  revert = "select 1"
}*/
data "snowsql_query" "select_current_user" {
  statements = "create database abcvaisakh123;"
}
