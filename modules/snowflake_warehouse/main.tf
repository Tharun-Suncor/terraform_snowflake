terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_warehouse" "warehouse" {
  name                                  = var.name
  comment                               = var.comment
  warehouse_size                        = var.size
  auto_suspend                          = var.auto_suspend
  auto_resume                           = var.auto_resume
  initially_suspended                   = var.initially_suspended
  enable_query_acceleration             = var.enable_query_acceleration
  query_acceleration_max_scale_factor   = var.query_acceleration_max_scale_factor
  warehouse_type                        = var.warehouse_type
  max_concurrency_level                 = var.max_concurrency_level
  statement_queued_timeout_in_seconds   = var.statement_queued_timeout_in_seconds
  statement_timeout_in_seconds          = var.statement_timeout_in_seconds
}
