
# Snowflake role
module "ROLE_1" {
  source   = "../modules/snowflake_role"
  name     = "DA_ROLE"
  comment  = "Data analyst role"

}