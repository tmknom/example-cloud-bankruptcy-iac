data "aws_iam_policy_document" "cloudwatch_events" {
  statement {
    effect    = "Allow"
    resources = [aws_sns_topic.mail.arn]
    actions   = ["sns:Publish"]

    principals {
      type = "Service"
      identifiers = [
        "events.amazonaws.com",
        "cloudwatch.amazonaws.com"
      ]
    }
  }
}
