variable "name" {
  description = "The name of the Snowflake role to create."
  type        = string
}

variable "comment" {
  description = "A comment for the Snowflake role."
  type        = string
  default     = null
}
