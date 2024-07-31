terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_stage" "stage" {
  name        = "STAGE_SILVER"
  url         = "azure://edpdevarmdlsuw2001.blob.core.windows.net/bakeoff-snowflake/Wellview_DL_type2"
  database    = "SILVER_DEV"
  schema      = "WELLSVIEW"
}
