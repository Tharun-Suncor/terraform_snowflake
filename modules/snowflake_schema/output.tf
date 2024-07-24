output "schema_name" {
  description = "The name of the created schema."
  value       = snowflake_schema.schema.name
}

output "database_name" {
  description = "The name of the database in which the schema was created."
  value       = snowflake_schema.schema.database
}