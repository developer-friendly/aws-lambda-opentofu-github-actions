data "aws_region" "current" {}

resource "github_branch_protection" "this" {
  repository_id = "aws-lambda-opentofu-github-actions"

  pattern          = "main"
  enforce_admins   = true
  allows_deletions = false

  force_push_bypassers = [
    "/meysam81",
  ]
}

resource "github_repository_environment" "this" {
  environment = var.environment_name
  repository  = "aws-lambda-opentofu-github-actions"

  prevent_self_review = false

  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

resource "github_actions_environment_secret" "this" {
  repository = "aws-lambda-opentofu-github-actions"

  environment     = github_repository_environment.this.environment
  secret_name     = "AWS_IAM_ROLE"
  plaintext_value = var.aws_iam_role
}

resource "github_actions_environment_variable" "this" {
  repository  = "aws-lambda-opentofu-github-actions"
  environment = var.environment_name

  variable_name = "AWS_REGION"
  value         = data.aws_region.current.name
}
