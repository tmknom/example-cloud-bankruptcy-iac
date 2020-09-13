data "aws_iam_policy_document" "rotate_access_key_access" {
  statement {
    effect = "Allow"
    actions = [
      "iam:CreateAccessKey",
      "iam:UpdateAccessKey",
      "iam:DeleteAccessKey",
      "iam:ListAccessKeys",
      "iam:GetAccessKeyLastUsed",
      "iam:GetUser",
    ]
    resources = ["arn:aws:iam::${local.account_id}:user/&{aws:username}"]
  }
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}

data "aws_caller_identity" "current" {}
