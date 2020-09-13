resource "aws_iam_policy" "ohio_access" {
  name   = "ohio-access"
  policy = data.aws_iam_policy_document.ohio_access.json
}

data "aws_iam_policy_document" "ohio_access" {
  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "chatbot:*",
      "sts:AssumeRole",
      "iam:PassRole",
    ]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestedRegion"
      values   = ["us-east-2"]
    }
  }
}
