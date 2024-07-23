terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "0.92.0"
    }
  }
}

# Define the role to be granted.
resource "snowflake_role" "role" {
  name = var.role_name
}

# Define the user to whom the role will be granted.
resource "snowflake_user" "user_" {
  name = var.user_name
}


# Grant the role to the specified user.
resource "snowflake_grant_account_role" "grant_to_user" {
  role_name = snowflake_role.role.name
  user_name = snowflake_user.user.name
}
