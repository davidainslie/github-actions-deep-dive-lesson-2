variable "account-id" {
  type      = string
  sensitive = true
}

variable "access-key" {
  type      = string
  sensitive = true
}

variable "secret-key" {
  type      = string
  sensitive = true
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "bucket" {
  type = string
}