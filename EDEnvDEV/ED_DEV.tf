
# Snowflake Warehouses
module "compute_wh_qut" {
  source   = "../modules/snowflake_warehouse"
  name     = "COMPUTE_WH_ED_QUT"
  size     = "X-SMALL"
  comment  = "Compute warehouse for QUT environment"
  auto_suspend                          = 60
  auto_resume                           = true
  initially_suspended                   = true
}