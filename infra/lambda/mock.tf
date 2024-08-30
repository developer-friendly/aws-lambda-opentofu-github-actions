data "http" "test_lambda_api" {
  url = "${aws_api_gateway_deployment.deployment.invoke_url}${var.api_gateway_resource_path}"

  request_headers = {
    Accept = "application/json"
  }

  depends_on = [aws_api_gateway_deployment.deployment]
}

resource "random_uuid" "test_lambda_api" {
  lifecycle {
    precondition {
      condition     = contains([200], data.http.test_lambda_api.status_code)
      error_message = "Status code invalid"
    }
  }
}
