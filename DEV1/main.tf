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

  name                                  = "COMPUTE_WH_DEV"
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

  name                        = "SILVER_DEV"
  is_transient                = false
  comment                     = "This is database"
  data_retention_time_in_days = 1
}

module "snowflake_schema" {
  source           = "../modules/snowflake_schema"
  
  database_name    = "SILVER_DEV"
  schema_name      = "WELLSVIEW"
  schema_comment   = "This is a schema"
  data_retention_days = -1
  is_managed = false
  is_transient = false
}

module "snowflake_schema_change_history" {
  source           = "../modules/snowflake_schema"
  
  database_name    = "SILVER_DEV"
  schema_name      = "SCHEMACHANGE"
  schema_comment   = "This is a schema to track change history"
  data_retention_days = -1
  is_managed = false
  is_transient = false
}
/*
module "snowflake_file_format" {
  source           = "../modules/snowflake_format_parquet"
  name        = "FORMAT_PARQUET"
  database    = "SILVER_DEV"
  schema      = "WELLSVIEW"
  format_type = "PARQUET"
}

module "snowflake_storage_integration" {
  source           = "../modules/snowflake_integration"
  name    = "INTEGRATION_SILVER_DEV"
  type    = "EXTERNAL_STAGE"
  enabled = true
  azure_tenant_id = "1aa51068-11a6-4bd2-8646-1fff31a30ffc"
  storage_allowed_locations =["azure://edpdevarmdlsuw2001.blob.core.windows.net/bakeoff-snowflake/"]
  storage_provider = "AZURE"
}

module "snowflake_stage" {
  source           = "../modules/snowflake_stage"
  name        = "STAGE_SILVER"
  url         = "azure://edpdevarmdlsuw2001.blob.core.windows.net/bakeoff-snowflake/Wellview_DL_type2"
  database    = "SILVER_DEV"
  schema      = "WELLSVIEW"
} */

