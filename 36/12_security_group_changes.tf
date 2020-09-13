module "security_group_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "security-group-changes"
  threshold = 1
  pattern   = "{($.eventName=AuthorizeSecurityGroupIngress) || ($.eventName=AuthorizeSecurityGroupEgress) || ($.eventName=RevokeSecurityGroupIngress) || ($.eventName=RevokeSecurityGroupEgress) || ($.eventName=CreateSecurityGroup) || ($.eventName=DeleteSecurityGroup)}"
}
