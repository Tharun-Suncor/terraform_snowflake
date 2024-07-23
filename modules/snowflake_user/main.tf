terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

resource "snowflake_user" "user" {
  name                    = var.name
  comment                 = var.comment
  disabled                = var.disabled
  default_warehouse       = var.default_warehouse
  default_namespace       = var.default_namespace
  default_role            = var.default_role
  rsa_public_key          = var.rsa_public_key
  rsa_public_key_2        = var.rsa_public_key_2
  must_change_password    = var.must_change_password
  password                = var.password
  login_name              = var.login_name
  display_name            = var.display_name
  email                   = var.email
  first_name              = var.first_name
  last_name               = var.last_name
  mins_to_unlock          = var.mins_to_unlock
  mins_to_bypass_mfa      = var.mins_to_bypass_mfa
  days_to_expiry          = var.days_to_expiry
  network_policy          = var.network_policy
}
