resource "aws_guardduty_detector" "this" {
  enable                       = true
  finding_publishing_frequency = "SIX_HOURS"
}

resource "aws_cloudwatch_event_rule" "this" {
  name = "guardduty-${data.aws_region.this.name}"

  event_pattern = jsonencode({
    source      = ["aws.guardduty"]
    detail-type = ["GuardDuty Finding"]
  })
}

resource "aws_cloudwatch_event_target" "this" {
  target_id = "guardduty-${data.aws_region.this.name}"
  rule      = aws_cloudwatch_event_rule.this.name
  arn       = aws_sns_topic.this.arn
}

resource "aws_sns_topic" "this" {
  name = "chatbot-${data.aws_region.this.name}"
}

data "aws_iam_policy_document" "this" {
  statement {
    effect    = "Allow"
    resources = [aws_sns_topic.this.arn]
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

resource "aws_sns_topic_policy" "this" {
  arn    = aws_sns_topic.this.arn
  policy = data.aws_iam_policy_document.this.json
}

data "aws_region" "this" {}

output "sns_topic_arn" {
  value = aws_sns_topic.this.arn
}
