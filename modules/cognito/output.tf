output "user_pool_id" {
  value = aws_cognito_user_pool.main.id
}

output "identity_pool_id" {
  value = aws_cognito_identity_pool.main.id
}

output "authenticated_role_arn" {
  value = aws_iam_role.authenticated.arn
}
