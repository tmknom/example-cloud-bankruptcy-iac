resource "aws_cloudwatch_log_metric_filter" "root_account_usages" {
  name           = "root-account-usages"
  log_group_name = "CloudTrail/logs"
  pattern        = "{$.userIdentity.type=\"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType !=\"AwsServiceEvent\"}"

  metric_transformation {
    name      = "root-account-usages"
    namespace = "LogMetrics"
    value     = 1
  }
}
