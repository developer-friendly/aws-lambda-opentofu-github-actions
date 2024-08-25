data "github_user" "current" {
  username = ""
}

resource "github_repository_environment" "this" {
  environment = "prod"
  repository  = "aws-lambda-opentofu-github-actions"

  reviewers {
    users = [data.github_user.current.id]
  }

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
