variable "internal_stage_name" {
  description = "Specifies the identifier for the internal stage."
  type        = string
}

variable "database_name" {
  description = "The database in which to create the stage."
  type        = string
}

variable "schema_name" {
  description = "The schema in which to create the stage."
  type        = string
}

variable "internal_stage_comment" {
  description = "Specifies a comment for the internal stage."
  type        = string
  default     = ""
}

variable "internal_stage_file_format" {
  description = "Specifies the file format for the internal stage."
  type        = string
  default     = "" # Example: "(TYPE = 'CSV')"
}

variable "internal_stage_tags" {
  description = "A map of tags to associate with the internal stage."
  type        = map(string)
  default     = {}
}
