provider "aws" {
  region              = "us-west-1"
  profile             = var.aws_profile
  allowed_account_ids = [var.aws_account_id]
}