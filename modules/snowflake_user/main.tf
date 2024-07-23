terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}


resource "snowflake_user" "user" {
  name                     = var.name
  password                 = var.password
  login_name               = var.login_name
  default_warehouse        = var.default_warehouse
  default_namespace        = var.default_namespace
  default_role             = var.default_role
  disabled                 = var.disabled
  must_change_password     = var.must_change_password
  first_name               = var.first_name
  last_name                = var.last_name
  email                    = var.email
  comment                  = var.comment
  default_secondary_roles  = var.default_secondary_roles
  rsa_public_key           = var.rsa_public_key
  rsa_public_key_2         = var.rsa_public_key_2
  has_rsa_public_key       = var.has_rsa_public_key
}
