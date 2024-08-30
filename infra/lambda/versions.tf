terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.64"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.5"
    }
  }

  required_version = "< 2"
}

provider "aws" {
  # we set AWS_PROFILE from the command line
}
