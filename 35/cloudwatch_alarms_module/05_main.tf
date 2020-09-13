variable "name" {}
variable "threshold" {}
variable "pattern" {}

resource "aws_cloudwatch_log_metric_filter" "this" {
  name           = var.name
  pattern        = var.pattern
  log_group_name = "CloudTrail/logs"

  metric_transformation {
    name      = var.name
    namespace = "LogMetrics"
    value     = 1
  }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  alarm_name          = var.name
  metric_name         = aws_cloudwatch_log_metric_filter.this.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.this.metric_transformation[0].namespace
  threshold           = var.threshold
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Sum"
  evaluation_periods  = 1
  period              = 300
  treat_missing_data  = "notBreaching"
  alarm_actions       = [data.aws_sns_topic.this.arn]
}

data "aws_sns_topic" "this" {
  name = "alert-mail"
}
