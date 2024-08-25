locals {
  workspace_name = replace(get_path_from_repo_root(), "/", "-")
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOF
    terraform {
      backend "remote" {
        hostname     = "app.terraform.io"
        organization = "developer-friendly"

        workspaces {
          name = "${local.workspace_name}"
        }
      }
    }
  EOF
}
