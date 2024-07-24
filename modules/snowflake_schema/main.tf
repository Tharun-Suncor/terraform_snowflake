terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}



resource "snowflake_schema" "schema" {
  database = var.database_name
  name     = var.schema_name
  comment  = var.schema_comment
}
