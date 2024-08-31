terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.94.0"
    }
  }
}

provider "snowflake" {
  account     = var.snowflake_account
  user        = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}



module "snowflake_stage" {
  source           = "../modules/snowflake_stage"
  name        = "STAGE_SILVER"
  database    = "SILVER_PRD"
  schema      = "WELLSVIEW"
  comment     = "internal stage"
  tags = {
    tag1 = {
      name = "COST_CENTER"
      value = "FINANCE"
      database = "TEST"
      schema = "SCH_TEST"
    }
  }
  depends_on = [module.snowflake_schema]
} 


