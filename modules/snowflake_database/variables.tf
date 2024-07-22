variable "name" {
  description = "The name of the Snowflake database to create."
  type        = string
}

variable "comment" {
  description = "A comment for the Snowflake database."
  type        = string
  default     = ""
}

variable "data_retention_time_in_days" {
  description = "The number of days for which historical data is retained."
  type        = number
  default     = 1
}

variable "is_transient" {
  description = "Whether the Snowflake database is transient."
  type        = bool
  default     = false
}
