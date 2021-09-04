terraform {
  required_version = "1.0.5"
}

module "gh-actions-boostrap" {
  source         = "./modules/gh-actions-bootstrap"
  pgp_public_key = var.pgp_public_key
  prefix         = "aws-infra"
}