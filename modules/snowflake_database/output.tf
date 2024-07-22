output "database_name" {
  description = "The name of the Snowflake database."
  value       = snowflake_database.database.name
}