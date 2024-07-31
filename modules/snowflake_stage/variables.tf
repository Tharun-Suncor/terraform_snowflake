variable "name" {
  description = "The name of the Snowflake stage to create."
  type        = string
}

variable "url" {
  description = "Specifies the URL for the stage"
  type        = string
}

variable "database" {
  description = "The database where to create stage."
  type        = string
}

variable "schema" {
  description = "The schema where to create stage"
  type        = string
  
}
