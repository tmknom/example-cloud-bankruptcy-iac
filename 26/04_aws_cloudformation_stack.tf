resource "aws_cloudformation_stack" "disable_security_group" {
  name = "AWS-DisablePublicAccessForSecurityGroup"

  template_body = yamlencode({
    Description = "Managed by Terraform"
    Resources = {
      DisablePublicAccessForSecurityGroup = {
        Type = "AWS::Config::RemediationConfiguration"
        Properties = {
          ConfigRuleName = aws_config_config_rule.restricted_ssh.name
          TargetType     = "SSM_DOCUMENT"
          TargetId       = "AWS-DisablePublicAccessForSecurityGroup"
          Parameters = {
            GroupId = {
              ResourceValue = {
                Value = "RESOURCE_ID"
              }
            },
            AutomationAssumeRole = {
              StaticValue = {
                Values = [module.automation_security_group_iam_role.arn]
              }
            }
          }
          Automatic                = true
          MaximumAutomaticAttempts = 1
          RetryAttemptSeconds      = 60
        }
      }
    }
  })
}
