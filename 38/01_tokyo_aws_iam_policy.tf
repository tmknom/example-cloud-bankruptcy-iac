resource "aws_iam_policy" "tokyo_access" {
  name   = "tokyo-access"
  policy = data.aws_iam_policy_document.tokyo_access.json
}

data "aws_iam_policy_document" "tokyo_access" {
  statement {
    effect    = "Allow"
    resources = ["*"]
    actions   = ["*"]

    condition {
      test     = "StringEquals"
      variable = "aws:RequestedRegion"
      values   = ["ap-northeast-1"]
    }
  }
}
