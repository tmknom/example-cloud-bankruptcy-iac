resource "aws_iam_policy" "virginia_access" {
  name   = "virginia-access"
  policy = data.aws_iam_policy_document.virginia_access.json
}

data "aws_iam_policy_document" "virginia_access" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "iam:*",
      "sts:*",
      "budgets:*",
      "ce:*",
      "cur:*",
      "savingsplans:*",
      "support:*",
      "health:*",
      "organizations:*",
      "route53:*",
      "route53domains:*",
      "cloudfront:*",
      "waf:*",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestedRegion"
      values   = ["us-east-1"]
    }
  }
}
