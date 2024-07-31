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

  name                        = "PROJECT1_DEV"
  is_transient                = false
  comment                     = "This is database"
  data_retention_time_in_days = 1
}


module "snowflake_schema" {
  source     = "../modules/snowflake_schema"
  database   = "EDW"
  schema     = "PROJECT1_DEV"
  comment   = "This is a schema"
  data_retention_days = -1
  is_managed = false
  is_transient = false
depends_on = [module.snowflake_database]
}


module "snowflake_schema_change_history" {
  source           = "../modules/snowflake_schema"
  database    = "PROJECT1_DEV"
  schema      = "SCHEMACHANGE"
  comment   = "This is a schema to track change history"
  data_retention_days = -1
  is_managed = false
  is_transient = false
  depends_on = [module.snowflake_database]
}
module "snowflake_schema_stage" {
  source           = "../modules/snowflake_schema"
  database    = "PROJECT1_DEV"
  schema      = "EDW_STAGE"
  comment   = "This is a schema for stage"
  data_retention_days = -1
  is_managed = false
  is_transient = false
  depends_on = [module.snowflake_database]
}
module "snowflake_schema_control_table_schema" {
  source           = "../modules/snowflake_schema"
  database    = "PROJECT1_DEV"
  schema      = "EDO"
  comment   = "This is a schema control table"
  data_retention_days = -1
  is_managed = false
  is_transient = false
  depends_on = [module.snowflake_database]
}


