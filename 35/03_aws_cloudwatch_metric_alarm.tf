resource "aws_cloudwatch_metric_alarm" "root_account_usages" {
  alarm_name          = "root-account-usages"
  metric_name         = aws_cloudwatch_log_metric_filter.root_account_usages.metric_transformation[0].name
  namespace           = aws_cloudwatch_log_metric_filter.root_account_usages.metric_transformation[0].namespace
  threshold           = 1
  comparison_operator = "GreaterThanOrEqualToThreshold"
  statistic           = "Sum"
  evaluation_periods  = 1
  period              = 300
  treat_missing_data  = "notBreaching"
  alarm_actions       = [data.aws_sns_topic.mail.arn]
}

data "aws_sns_topic" "mail" {
  name = "alert-mail"
}
