terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}


resource "snowflake_tag" "tag" {
  name           = var.tag_name
  database       = var.database_name
  schema         = var.schema_name
  allowed_values = var.allowed_values
  comment        = var.comment
}
