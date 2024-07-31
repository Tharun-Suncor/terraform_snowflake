
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

module "snowflake_warehouse" {
  source = "../modules/snowflake_warehouse"

  name                                  = "COMPUTE_WH_ED_PRD"
  comment                               = "This is warehouse"
  size                                  = "XSMALL"
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
  source = "../modules/snowflake_database"

  name                        = "ED_PRD"
  is_transient                = false
  comment                     = "This is database"
  data_retention_time_in_days = 1
}


module "snowflake_schema" {
  source     = "../modules/snowflake_schema"
  database   = "ED_PRD"
  schema     = "EDW"
  comment   = "This is a schema"
  data_retention_days = -1
  is_managed = false
  is_transient = false
depends_on = [module.snowflake_database]
}


module "snowflake_schema_change_history" {
  source           = "../modules/snowflake_schema"
  database    = "ED_PRD"
  schema      = "SCHEMACHANGE"
  comment   = "This is a schema to track change history"
  data_retention_days = -1
  is_managed = false
  is_transient = false
  depends_on = [module.snowflake_database]
}
module "snowflake_schema_stage" {
  source           = "../modules/snowflake_schema"
  database    = "ED_PRD"
  schema      = "EDWSTAGE"
  comment   = "This is a schema for stage"
  data_retention_days = -1
  is_managed = false
  is_transient = false
  depends_on = [module.snowflake_database]
}
module "snowflake_schema_control_table_schema" {
  source           = "../modules/snowflake_schema"
  database    = "ED_PRD"
  schema      = "EDO"
  comment   = "This is a schema control table"
  data_retention_days = -1
  is_managed = false
  is_transient = false
  depends_on = [module.snowflake_database]
}
