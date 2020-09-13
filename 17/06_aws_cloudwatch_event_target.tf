resource "aws_cloudwatch_event_target" "securityhub" {
  target_id = "securityhub"
  rule      = aws_cloudwatch_event_rule.securityhub.name
  arn       = data.aws_sns_topic.mail.arn

  input_transformer {
    input_paths = {
      "description" = "$.detail.findings[0].Description"
      "severity"    = "$.detail.findings[0].Severity.Label"
    }
    input_template = "\"Security Hub(<severity>) - <description>\""
  }
}

data "aws_sns_topic" "mail" {
  name = "alert-mail"
}
