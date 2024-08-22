variable "tag_name" {
  description = "The name of the Snowflake tag."
  type        = string
}

variable "database_name" {
  description = "The name of the Snowflake database."
  type        = string
}

variable "schema_name" {
  description = "The name of the Snowflake schema."
  type        = string
}

variable "allowed_values" {
  description = "A list of allowed values for the tag."
  type        = list(string)
}

variable "comment" {
  description = "A comment for the Snowflake tag."
  type        = string
  default     = null
}

