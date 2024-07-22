variable "name" {
  description = "The name of the Snowflake database to create."
  type        = string
}

variable "comment" {
  description = "A comment for the Snowflake database."
  type        = string
  default     = null
}
