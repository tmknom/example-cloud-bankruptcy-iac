module "alternative_root_account_usages" {
  source    = "./cloudwatch_alarms_module"
  name      = "alternative-root-account-usages"
  threshold = 1
  pattern   = "{$.userIdentity.type=\"Root\" && $.userIdentity.invokedBy NOT EXISTS && $.eventType !=\"AwsServiceEvent\"}"
}
