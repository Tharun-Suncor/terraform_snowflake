variable "snowflake_username" {
  description = "Username for the Snowflake account"
  type        = string
}

variable "snowflake_account" {
  description = "Account identifier for the Snowflake account"
  type        = string
}

variable "snowflake_role" {
  description = "Role to use for the Snowflake account"
  type        = string
}

variable "snowflake_password" {
  description = "Password for the Snowflake account"
  type        = string
  sensitive   = true
}

