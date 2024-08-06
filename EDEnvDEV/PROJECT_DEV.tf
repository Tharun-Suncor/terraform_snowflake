terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

provider "snowflake" {
  account  = var.snowflake_account
  user     = var.snowflake_username
  password = var.snowflake_password
  role     = var.snowflake_role
}

# Snowflake Warehouses
module "compute_wh_qut" {
  source   = "../modules/snowflake_warehouse"
  name     = "COMPUTE_WH_PROJECT_QUT"
  size     = "X-SMALL"
  comment  = "Compute warehouse for QUT environment"
  auto_suspend                          = 60
  auto_resume                           = true
  initially_suspended                   = true
}