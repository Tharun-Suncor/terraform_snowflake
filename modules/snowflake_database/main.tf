terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.61"
    }
  }
}

resource "snowflake_database" "database" {
  name    = var.name
  comment = var.comment
}




