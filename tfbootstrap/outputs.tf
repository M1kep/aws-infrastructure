output "user_access_key_id" {
  value = aws_iam_access_key.terraform-cloud.id
}

output "user_access_key_encrypted_secret" {
  value = aws_iam_access_key.terraform-cloud.encrypted_secret
}