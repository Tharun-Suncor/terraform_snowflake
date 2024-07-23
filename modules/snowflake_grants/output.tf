output "granted_role_to_user" {
  description = "The role granted to the user."
  value       = snowflake_grant_account_role.grant_to_user.role_name
}

output "granted_role_to_parent_role" {
  description = "The role granted to the parent role."
  value       = snowflake_grant_account_role.grant_to_parent_role.role_name
}
