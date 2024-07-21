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

variable "backend_resource_group_name" {
  description = "Name of the Azure Resource Group for Terraform state"
}

variable "backend_storage_account_name" {
  description = "Name of the Azure Storage Account for Terraform state"
}

variable "backend_container_name" {
  description = "Name of the Azure Blob container for Terraform state"
}

variable "backend_key" {
  description = "Key for the Terraform state file"
}
