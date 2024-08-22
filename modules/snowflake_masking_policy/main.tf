terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}



resource "snowflake_masking_policy" "masking_policy" {
  name              = var.name
  database          = var.database
  schema            = var.schema
   
  signature {
    column {
      name = var.signature_column_name
      type = var.signature_column_type
    }
  }
  
  masking_expression = var.masking_expression
  return_data_type  = var.return_data_type
  comment               = var.comment
  exempt_other_policies = var.exempt_other_policies
  if_not_exists         = var.if_not_exists
  or_replace            = var.or_replace
}
