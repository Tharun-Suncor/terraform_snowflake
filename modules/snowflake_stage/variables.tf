variable "name" {
  description = "The name of the Snowflake warehouse to create."
  type        = string
}

variable "comment" {
  description = "A comment for the Snowflake warehouse."
  type        = string
  default     = ""
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

variable "enable_query_acceleration" {
  description = "Enable query acceleration for the warehouse."
  type        = bool
  default     = false
}

variable "query_acceleration_max_scale_factor" {
  description = "The maximum scale factor for query acceleration."
  type        = number
  default     = 8
}



variable "warehouse_type" {
  description = "The type of the Snowflake warehouse (STANDARD | VIRTUAL)."
  type        = string
  default     = "STANDARD"
}

variable "max_concurrency_level" {
  description = "The maximum concurrency level for the warehouse."
  type        = number
  default     = 8
}

variable "statement_queued_timeout_in_seconds" {
  description = "The number of seconds a statement can be queued before it times out."
  type        = number
  default     = 0
}

variable "statement_timeout_in_seconds" {
  description = "The number of seconds before a running statement times out."
  type        = number
  default     = 172800
}
