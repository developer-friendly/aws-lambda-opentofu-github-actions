variable "aws_iam_role" {
  type        = string
  description = "The ARN of the IAM role to assume"
}

variable "environment_name" {
  type     = string
  nullable = false
}

variable "terraform_cloud_token" {
  type        = string
  description = "The token to authenticate with Terraform Cloud"
  sensitive   = true
  nullable    = false
}
