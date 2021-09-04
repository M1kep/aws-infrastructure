variable "aws_profile" {
  type        = string
  description = "The AWS Profile to be used for the bootstrap. This can be defined via an *.auto.tfvars file."
}

variable "aws_account_id" {
  type        = string
  description = "The AccountID of the AWS account. This is used to restrict the AWS provider."
}

variable "pgp_public_key" {
  type        = string
  description = "The Base64 encoded public PGP key for encrypting the IAM user access keys."
}