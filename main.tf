terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.63.0"
    }
  }
}

terraform {
  backend "local" {
    path = "../terraform.tfstate"
  }
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

module "snowflake_warehouse_2" {
  source = "./modules/snowflake_warehouse"

  name                 = "my_warehouse_2"
  comment              = "This is my second warehouse"
  size                 = "MEDIUM"
  auto_suspend         = 120
  auto_resume          = true
  initially_suspended  = false
}
