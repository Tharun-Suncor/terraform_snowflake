terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

provider "snowflake" {
  account     = var.snowflake_account
  user        = var.snowflake_username
  password    = var.snowflake_password
  role        = var.snowflake_role
}



module "snowflake_database" {
  source = "../modules/snowflake_database"

  name                        = "SILVER_PRD1"
  is_transient                = false
  comment                     = "This is database"
  data_retention_time_in_days = 1
}


module "snowflake_schema" {
  source     = "../modules/snowflake_schema"
  database   = "SILVER_PRD1"
  schema     = "WELLSVIEW"
  comment   = "This is a schema"
  data_retention_days = -1
  is_managed = false
  is_transient = false
depends_on = [module.snowflake_database]
}



module "snowflake_stage" {
  source           = "../modules/snowflake_stage"
  name        = "STAGE_SILVER"
  database    = "SILVER_PRD1"
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


