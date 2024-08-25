variable "api_gateway_rest_api_id" {
  type        = string
  description = "The ID of the REST API"
}

variable "api_gateway_resource_id" {
  type        = string
  description = "The ID of the API Gateway resource"
}

variable "api_gateway_resource_path" {
  type        = string
  description = "The path of the API Gateway resource"
}

variable "api_gateway_http_method" {
  type        = string
  description = "The HTTP method of the API Gateway resource"
}

variable "api_gateway_rest_api_execution_arn" {
  type        = string
  description = "The execution ARN of the REST API"
}
