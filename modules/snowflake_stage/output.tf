output "snowflake_stage" {
  description = "The name of the stage created"
  value       = snowflake_stage.internal_stage.name
}
