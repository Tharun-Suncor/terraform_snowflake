terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_storage_integration" "integration" {
  name    = var.name
  type    = var.type
  enabled = var.enabled
  azure_tenant_id = var.azure_tenant_id
  storage_allowed_locations =var.storage_allowed_locations
}
