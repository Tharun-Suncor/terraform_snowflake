terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_stage" "stage" {
  name        = var.name
  url         = var.url
  database    = var.database
  schema      = var.schema
}
