module "chatbot_iam_role" {
  source     = "./iam_role_module"
  name       = "chatbot"
  identifier = "chatbot.amazonaws.com"
  policy     = data.aws_iam_policy_document.cloudwatch_access.json
}
