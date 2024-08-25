include "root" {
  path = find_in_parent_folders()
}

inputs = {
  aws_iam_role = dependency.github_oidc.outputs.role_arn
}

dependency "github_oidc" {
  config_path = "../aws-github-oidc"
}
