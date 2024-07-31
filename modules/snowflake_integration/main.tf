terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_storage_integration" "integration" {
  name    = "INTEGRATION_SILVER_DEV"
  comment = "A storage integration"
  type    = "EXTERNAL_STAGE"
  enabled = true
  azure_tenant_id = '1aa51068-11a6-4bd2-8646-1fff31a30ffc'
  storage_allowed_locations =('azure://edpdevarmdlsuw2001.blob.core.windows.net/bakeoff-snowflake/')
}
