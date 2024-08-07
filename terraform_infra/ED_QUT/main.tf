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
module "M_COMPUTE_WH_ED_QUT" {
  source = "../../modules/snowflake_warehouse"

  name                                  = "COMPUTE_WHHHHH_ED_QUT"
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



module "snowflake_database_ED" {
  source = "../../modules/snowflake_database"

  name                        = "SILVERRR_QUT"
  is_transient                = false
  comment                     = "This i  c s  database"
  data_retention_time_in_days = 1
}


