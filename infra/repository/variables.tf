variable "aws_iam_role" {
  type        = string
  description = "The ARN of the IAM role to assume"
}

variable "environment_name" {
  type     = string
  nullable = false
}
