terraform {
  required_version = "1.0.6"
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "m1kep-personal"

    workspaces {
      name = "aws-infrastructure"
    }
  }
}