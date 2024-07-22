terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "latest"
    }
  }
}

resource "snowflake_database" "database" {
  name    = var.name
  comment = var.comment
}




