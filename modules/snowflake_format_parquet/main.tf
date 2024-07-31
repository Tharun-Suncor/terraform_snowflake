terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_file_format" "file_format" {
  name        = "FORMAT_PARQUET"
  database    = "SILVER_DEV"
  schema      = "WELLSVIEW"
  format_type = "PARQUET"
}
