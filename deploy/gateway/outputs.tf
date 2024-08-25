output "api_gateway_rest_api_id" {
  value = aws_api_gateway_rest_api.this.id
}

output "api_gateway_resource_id" {
  value = aws_api_gateway_resource.this.id
}

output "api_gateway_resource_path" {
  value = aws_api_gateway_resource.this.path
}

output "api_gateway_http_method" {
  value = aws_api_gateway_method.this.http_method
}

output "api_gateway_rest_api_execution_arn" {
  value = aws_api_gateway_rest_api.this.execution_arn
}
