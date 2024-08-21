terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_database_role" "db_role" {
  database = var.database
  name    = var.name
  comment = var.comment
}