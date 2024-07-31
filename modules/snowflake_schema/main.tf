terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_schema" "schema" {
  database = var.database
  name     = var.schema
  comment  = var.comment
  is_transient        = var.is_transient
  is_managed          = var.is_managed
  data_retention_days = var.data_retention_days
}
