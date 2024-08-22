output "masking_policy_name" {
  description = "The name of the created Snowflake masking policy."
  value       = snowflake_masking_policy.masking_policy.name
}
