resource "aws_cloudwatch_event_target" "access_analyzer" {
  target_id = "access-analyzer"
  rule      = aws_cloudwatch_event_rule.access_analyzer.name
  arn       = data.aws_sns_topic.mail.arn

  input_transformer {
    input_paths = {
      "type"     = "$.detail.resourceType"
      "resource" = "$.detail.resource"
      "action"   = "$.detail.action"
    }

    input_template = <<EOF
      "<type>/<resource> allows public access."
      "Action granted: <action>"
    EOF
  }
}

data "aws_sns_topic" "mail" {
  name = "alert-mail"
}
