variable "pgp_public_key" {
  type        = string
  description = "The Base64 encoded public PGP key for encrypting the IAM user access keys"
}

variable "prefix" {
  type        = string
  description = "Prefix to be used for the IAM User name attribute"
}