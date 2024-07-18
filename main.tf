terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }
}

provider "snowflake" {
  username    = var.snowflake_username
  account     = var.snowflake_account
  role        = var.snowflake_role
  password    = var.snowflake_password
  region      = var.snowflake_region
}


module "snowflake_warehouse" {
  source = "./modules/snowflake-warehouse"

  name                 = "my_warehouse"
  comment              = "This is my warehouse"
  size                 = "X-SMALL"
  auto_suspend         = 60
  auto_resume          = true
  initially_suspended  = true
}
