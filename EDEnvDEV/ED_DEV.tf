
# Snowflake role
module "ROLE_1" {
  source   = "../modules/snowflake_role"
  name     = "DA_ROLE"
  comment  = "Data analyst role"

}

# Snowflake role
module "DB_ROLE_1" {
  source   = "../modules/snowflake_database_role"
  database = "TEST"
  name     = "DB_ROLE"
  comment  = "DB role"

}


module "snowflake_tag_module" {
  source = "../modules/snowflake_tag"

  tag_name       = "cost_center"
  database_name  = "TEST"
  schema_name    = "SCH_TEST"
  allowed_values = ["finance", "engineering"]
  comment        = "sample tag"
}



module "snowflake_masking_policy_module" {
  source = "../modules/snowflake_masking_policy"

  name               = "EXAMPLE_MASKING_POLICY"
  database           = "EXAMPLE_DB"
  schema             = "EXAMPLE_SCHEMA"
  masking_expression = <<-EOF
    case 
      when current_role() in ('ROLE_A') then 
        val 
      when is_role_in_session('ROLE_B') then 
        'ABC123'
      else
        '******'
    end
  EOF
  return_data_type       = "VARCHAR"
  signature = {
    column_name = "val"
    column_type = "VARCHAR"
  }
  comment                = "This is a sample masking policy."
  exempt_other_policies  = false
  if_not_exists          = true
  or_replace             = false
}

