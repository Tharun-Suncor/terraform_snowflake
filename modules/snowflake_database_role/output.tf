output "role_name" {
  description = "The name of the Snowflake database role."
  value       = snowflake_database_role.db_role.name
}