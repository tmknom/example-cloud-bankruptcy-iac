resource "aws_sns_topic_policy" "cloudwatch_events" {
  arn    = aws_sns_topic.mail.arn
  policy = data.aws_iam_policy_document.cloudwatch_events.json
}
