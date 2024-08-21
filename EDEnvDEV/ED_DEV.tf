
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
}

