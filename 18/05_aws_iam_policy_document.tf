data "aws_iam_policy_document" "chatbot" {
  statement {
    effect    = "Allow"
    resources = [aws_sns_topic.chatbot.arn]
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
