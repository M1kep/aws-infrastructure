resource "aws_iam_user" "terraform-cloud" {
  name = "terraform-cloud"
  path = "/services/"

  tags = {
    Name = "terraform-cloud"
  }
}

resource "aws_iam_access_key" "terraform-cloud" {
  user    = aws_iam_user.terraform-cloud.name
  pgp_key = var.pgp_public_key
}

data "aws_iam_policy_document" "terraform-cloud-tfaccess" {
  statement {
    sid    = "AllowTFAccess"
    effect = "Allow"
    actions = [
      "vpc:*",
      "iam:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "terraform-cloud-tfaccess" {
  name   = "terraform-cloud-tfaccess"
  policy = data.aws_iam_policy_document.terraform-cloud-tfaccess.json
}

resource "aws_iam_user_policy_attachment" "terraform-cloud-tfaccess" {
  policy_arn = aws_iam_policy.terraform-cloud-tfaccess.arn
  user       = aws_iam_user.terraform-cloud.name
}