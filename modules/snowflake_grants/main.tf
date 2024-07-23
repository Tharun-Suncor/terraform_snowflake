terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

# Grant the role to the specified user.
resource "snowflake_grant_account_role" "grant_to_user" {
  role_name = var.role_name
  user_name = var.user_name
}
