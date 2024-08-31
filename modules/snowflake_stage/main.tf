terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.94.0"
    }
  }
}
resource "snowflake_stage" "internal_stage" {
  name     = var.name
  database = var.database
  schema   = var.schema
  comment  = var.comment

  # Optional parameters
  file_format = var.file_format

  # Tags for the stage with optional database and schema
  dynamic "tag" {
    for_each = var.tags
    content {
      name     = tag.value.name
      value    = tag.value.value
      database = lookup(tag.value, "database", null)
      schema   = lookup(tag.value, "schema", null)
    }
  }
}
