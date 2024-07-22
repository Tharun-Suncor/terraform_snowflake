output "role_name" {
  description = "The name of the Snowflake role."
  value       = snowflake_role.role.name
}