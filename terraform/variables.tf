variable "registry_url" {
  description = "The URL of the container registry."
  type        = string
}

variable "registry_username" {
  description = "The username for the container registry."
  type        = string
}

variable "registry_password" {
  description = "The password for the container registry."
  type        = string
  sensitive   = true
}
