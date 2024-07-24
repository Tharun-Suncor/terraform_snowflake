variable "schema_name" {
  description = "The name of the schema to create."
  type        = string
}

variable "database_name" {
  description = "The name of the database in which to create the schema."
  type        = string
}

variable "schema_comment" {
  description = "A comment or description for the schema."
  type        = string
  default     = ""
}

variable "data_retention_days" {
  description = "Number of days for which to retain data."
  type        = number
  default     = 0
}

variable "is_managed" {
  description = "Whether the schema is managed."
  type        = bool
  default     = false
}

variable "is_transient" {
  description = "Whether the schema is transient."
  type        = bool
  default     = false
}