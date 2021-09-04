resource "aws_iam_user" "gh-actions-tf-access" {
  name = "${var.prefix}-gh-actions"
  path = "/services/"

  tags = {
    Name = "${var.prefix}-gh-actions"
  }
}

resource "aws_iam_access_key" "gh-actions-tf-access" {
  user    = aws_iam_user.gh-actions-tf-access.name
  pgp_key = var.pgp_public_key
}

data "aws_iam_policy_document" "gh-actions-tf-access" {
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

resource "aws_iam_policy" "gh-actions" {
  name   = "${var.prefix}-gh-actions-tf-access"
  policy = data.aws_iam_policy_document.gh-actions-tf-access.json
}

resource "aws_iam_user_policy_attachment" "gh-actions" {
  policy_arn = aws_iam_policy.gh-actions.arn
  user       = aws_iam_user.gh-actions-tf-access.name
}