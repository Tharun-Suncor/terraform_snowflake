variable "role_name" {
  description = "The name of the role to be granted."
  type        = string
}

variable "parent_role_name" {
  description = "The name of the parent role to which the role will be granted."
  type        = string
}

variable "user_name" {
  description = "The name of the user to which the role will be granted."
  type        = string
  sensitive   = true
}
