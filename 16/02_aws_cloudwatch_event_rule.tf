resource "aws_cloudwatch_event_rule" "access_analyzer" {
  name = "access-analyzer"

  event_pattern = jsonencode({
    source      = ["aws.access-analyzer"]
    detail-type = ["Access Analyzer Finding"]
    detail = {
      status = ["ACTIVE"]
    }
  })
}
