variable "name" {
  description = "The name of the Snowflake masking policy."
  type        = string
}

variable "database" {
  description = "The name of the Snowflake database where the masking policy will be created."
  type        = string
}

variable "schema" {
  description = "The name of the Snowflake schema where the masking policy will be created."
  type        = string
}

variable "masking_expression" {
  description = "The SQL expression that transforms the data."
  type        = string
}

variable "return_data_type" {
  description = "The data type to return after masking."
  type        = string
}

variable "signature_column_name" {
  description = "The name of the input column for the masking policy."
  type        = string
}

variable "signature_column_type" {
  description = "The data type of the input column for the masking policy."
  type        = string
}

variable "comment" {
  description = "A comment for the masking policy."
  type        = string
  default     = null
}

variable "exempt_other_policies" {
  description = "Whether the policy can be referenced by another masking policy or row access policy."
  type        = bool
  default     = false
}

variable "if_not_exists" {
  description = "Prevent overwriting an existing masking policy with the same name."
  type        = bool
  default     = false
}

variable "or_replace" {
  description = "Whether to override an existing masking policy with the same name."
  type        = bool
  default     = false
}
