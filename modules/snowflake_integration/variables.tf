variable "name" {
  description = "The name of the Snowflake storage integration"
  type        = string
}

variable "comment " {
  description = "Any comment regarding integration"
  type        = string
}

variable "type" {
  description = "kind of storage"
  type        = string
}

variable "enabled" {
  description = "should enabled or not"
  type        = boolean
}
variable "azure_tenant_id" {
  description = "Mention azure tenant id"
  type        = string
}
variable "storage_allowed_locations " {
  description = "Mention location"
  type        = string
}
