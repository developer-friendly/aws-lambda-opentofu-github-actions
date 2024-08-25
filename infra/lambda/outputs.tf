output "lambda_public_url" {
  value = format("%s%s", aws_api_gateway_deployment.deployment.invoke_url, var.api_gateway_resource_path)
}

output "lambda_arn" {
  value = aws_lambda_function.this.arn
}
