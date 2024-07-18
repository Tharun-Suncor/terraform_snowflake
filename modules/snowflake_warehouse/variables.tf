variable "name" {
  description = "The name of the Snowflake warehouse to create."
  type        = string
}

variable "comment" {
  description = "A comment for the Snowflake warehouse."
  type        = string
  default     = null
}

variable "size" {
  description = "The size of the Snowflake warehouse."
  type        = string
  default     = "X-SMALL"
}

variable "auto_suspend" {
  description = "The number of seconds of inactivity after which the warehouse should be automatically suspended."
  type        = number
  default     = 60
}

variable "auto_resume" {
  description = "Whether the warehouse should be automatically resumed when a SQL statement is submitted."
  type        = bool
  default     = true
}

variable "initially_suspended" {
  description = "Whether the warehouse should be created in the 'suspended' state."
  type        = bool
  default     = true
}
