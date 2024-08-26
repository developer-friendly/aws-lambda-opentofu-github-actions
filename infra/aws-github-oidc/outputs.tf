output "role_arn" {
  value = aws_iam_role.this.arn
}

output "environment_name" {
  value = var.environment_name
}
