inputs = {
  api_gateway_rest_api_id            = dependency.gtw.outputs.api_gateway_rest_api_id
  api_gateway_resource_id            = dependency.gtw.outputs.api_gateway_resource_id
  api_gateway_resource_path          = dependency.gtw.outputs.api_gateway_resource_path
  api_gateway_http_method            = dependency.gtw.outputs.api_gateway_http_method
  api_gateway_rest_api_execution_arn = dependency.gtw.outputs.api_gateway_rest_api_execution_arn
}

dependency "gtw" {
  config_path = "../gateway"
}
