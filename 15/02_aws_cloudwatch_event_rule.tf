resource "aws_cloudwatch_event_rule" "guardduty" {
  name = "guardduty"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
  })
}
