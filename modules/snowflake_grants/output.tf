output "role_name" {
  description = "The name of the role granted."
  value       = snowflake_grant_account_role.grant_to_role.role_name
}

output "user_name" {
  description = "The name of the user granted the role."
  value       = snowflake_grant_account_role.grant_to_user.user_name
}
