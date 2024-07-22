terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_database" "database" {
  name                         = var.name
  comment                      = var.comment
  data_retention_time_in_days  = var.data_retention_time_in_days
  is_transient                 = var.is_transient
}




