data "aws_iam_policy_document" "cloudtrail" {
  statement {
    effect    = "Allow"
    resources = ["arn:aws:logs:*:*:log-group:*:log-stream:*"]

    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
  }
}
