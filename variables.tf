variable "snowflake_username" {
  description = "Username for the Snowflake account"
  type        = string
}

variable "snowflake_account" {
  description = "Account identifier for the Snowflake account"
  type        = string
}

variable "snowflake_role" {
  description = "Role to use for the Snowflake account"
  type        = string
}

variable "snowflake_password" {
  description = "Password for the Snowflake account"
  type        = string
  sensitive   = true
}

# Azure Backend Variables
variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
}

variable "container_name" {
  description = "Name of the container within the Azure Storage Account"
  type        = string
  default     = "terraform-state" # Default value can be overridden
}

variable "state_file_name" {
  description = "Name of the Terraform state file"
  type        = string
  default     = "terraform.tfstate" # Default value can be overridden
}