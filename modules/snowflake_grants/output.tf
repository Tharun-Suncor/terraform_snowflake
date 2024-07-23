output "granted_role_to_user" {
  description = "The role granted to the user."
  value       = snowflake_grant_account_role.grant_to_user.role_name
}
