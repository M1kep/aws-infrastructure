output "access_key_id" {
  value = aws_iam_access_key.gh-actions-tf-access.id
}

output "access_key_encrypted_secret" {
  value = aws_iam_access_key.gh-actions-tf-access.encrypted_secret
}