resource "aws_cloudwatch_event_target" "chatbot" {
  target_id = "chatbot"
  rule      = aws_cloudwatch_event_rule.guardduty.name
  arn       = aws_sns_topic.chatbot.arn
}
