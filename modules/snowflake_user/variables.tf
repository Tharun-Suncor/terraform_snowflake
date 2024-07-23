variable "name" {
  description = "Name of the Snowflake user."
  type        = string
}

variable "comment" {
  description = "Comment for the user."
  type        = string
  default     = null
}

variable "disabled" {
  description = "Whether the user is disabled."
  type        = bool
  default     = false
}

variable "default_warehouse" {
  description = "Default warehouse for the user."
  type        = string
  default     = null
}

variable "default_namespace" {
  description = "Default namespace for the user."
  type        = string
  default     = null
}

variable "default_role" {
  description = "Default role for the user."
  type        = string
  default     = null
}

variable "rsa_public_key" {
  description = "RSA public key for the user."
  type        = string
  default     = null
}

variable "rsa_public_key_2" {
  description = "Second RSA public key for the user."
  type        = string
  default     = null
}

variable "must_change_password" {
  description = "Require password change on first login."
  type        = bool
  default     = false
}

variable "password" {
  description = "Password for the user."
  type        = string
  default     = null
}

variable "login_name" {
  description = "Login name for the user."
  type        = string
  default     = null
}

variable "email" {
  description = "Email address for the user."
  type        = string
  default     = null
}

variable "first_name" {
  description = "First name of the user."
  type        = string
  default     = null
}

variable "last_name" {
  description = "Last name of the user."
  type        = string
  default     = null
}

variable "default_secondary_roles" {
  description = "Default secondary roles for the user."
  type        = list(string)
  default     = ["ALL"]
}
