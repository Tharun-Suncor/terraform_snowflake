terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_file_format" "file_format" {
  name        = var.name
  database    =  var.database
  schema      =  var.schema
  format_type =  var.format_type
}
