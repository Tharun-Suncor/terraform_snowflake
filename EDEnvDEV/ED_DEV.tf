
# Snowflake role
module "ROLE_1" {
  source   = "../modules/snowflake_role"
  name     = "DA_ROLE"
  comment  = "Data analyst role"

}

# Snowflake role
module "DB_ROLE_1" {
  source   = "../modules/snowflake_database_role"
  database = "SNOWFLAKE"
  name     = "DB_ROLE"
  comment  = "DB role"

}