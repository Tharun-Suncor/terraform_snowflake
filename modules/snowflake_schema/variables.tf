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
