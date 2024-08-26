data "tls_certificate" "oidc_thumbprint" {
  url = "https://token.actions.githubusercontent.com"
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = [
      "sts:AssumeRoleWithWebIdentity",
    ]
    effect = "Allow"

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions.arn]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:sub"
      values   = ["repo:developer-friendly/aws-lambda-opentofu-github-actions:environment:${var.environment_name}"]
    }

    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "lambda_policy" {
  statement {
    actions = [
      "lambda:PublishLayerVersion",
      "lambda:UpdateFunctionCode",
      "lambda:UpdateFunctionConfiguration",
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_openid_connect_provider" "github_actions" {
  url            = "https://token.actions.githubusercontent.com"
  client_id_list = ["sts.amazonaws.com"]
  thumbprint_list = [
    data.tls_certificate.oidc_thumbprint.certificates[0].sha1_fingerprint,
  ]
}

resource "aws_iam_role" "this" {
  name               = "github-actions"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  inline_policy {
    name   = "lambda_policy"
    policy = data.aws_iam_policy_document.lambda_policy.json
  }
}
