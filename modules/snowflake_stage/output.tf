output "snowflake_stage" {
  description = "The name of the stage created"
  value       = snowflake_schema.schema.name
}
