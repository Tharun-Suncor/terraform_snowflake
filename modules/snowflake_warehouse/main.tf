terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.61"
    }
  }
}

resource "snowflake_warehouse" "warehouse" {
  name     = var.name
  comment  = var.comment
  warehouse_size = var.size
  auto_suspend = var.auto_suspend
  auto_resume = var.auto_resume
  initially_suspended = var.initially_suspended
}
