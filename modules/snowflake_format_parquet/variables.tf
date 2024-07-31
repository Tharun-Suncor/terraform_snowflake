variable "name" {
  description = "The name of the Snowflake file format to create."
  type        = string
}

variable "database" {
  description = "Under which snowflake database file format to be created"
  type        = string
  default     = ""
}

variable "schema" {
  description = "Under which snowflake database schema file format to be created"
  type        = string
  default     = ""
}

variable "format_type" {
  description = "what would be the type for file"
  type        = string
  default     = "PARQUET"
}
