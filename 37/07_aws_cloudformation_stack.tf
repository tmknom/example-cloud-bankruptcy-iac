resource "aws_cloudformation_stack" "chatbot" {
  name = "chatbot"

  template_body = yamlencode({
    Description = "Managed by Terraform"
    Resources = {
      AlertNotifications = {
        Type = "AWS::Chatbot::SlackChannelConfiguration"
        Properties = {
          ConfigurationName = "AlertNotifications"
          SlackWorkspaceId  = "EXAMPLEID"
          SlackChannelId    = "ABCBBLZZZ"
          IamRoleArn        = module.chatbot_iam_role.arn
          SnsTopicArns = [
            module.tokyo.sns_topic_arn,
            module.virginia.sns_topic_arn,
          ]
        }
      }
    }
  })
}
