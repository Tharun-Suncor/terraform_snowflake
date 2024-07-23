variable "name" {
  description = "Name of the user"
  type        = string
}

variable "password" {
  description = "Password for the user"
  type        = string
}

variable "login_name" {
  description = "Login name for the user"
  type        = string
}

variable "default_warehouse" {
  description = "Default warehouse for the user"
  type        = string
}

variable "default_namespace" {
  description = "Default namespace for the user"
  type        = string
}

variable "default_role" {
  description = "Default role for the user"
  type        = string
}

variable "disabled" {
  description = "Whether the user is disabled"
  type        = bool
  default     = false
}

variable "must_change_password" {
  description = "Whether the user must change password on next login"
  type        = bool
  default     = false
}

variable "first_name" {
  description = "First name of the user"
  type        = string
}

variable "last_name" {
  description = "Last name of the user"
  type        = string
}

variable "email" {
  description = "Email of the user"
  type        = string
}

variable "comment" {
  description = "Comment about the user"
  type        = string
}

variable "default_secondary_roles" {
  description = "Default secondary roles for the user"
  type        = list(string)
}

variable "rsa_public_key" {
  description = "RSA public key for the user"
  type        = string
}

variable "rsa_public_key_2" {
  description = "Second RSA public key for the user"
  type        = string
}

variable "has_rsa_public_key" {
  description = "Whether the user has an RSA public key"
  type        = bool
  default     = false
}
