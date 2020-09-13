module "automation_security_group_iam_role" {
  source     = "./iam_role_module"
  name       = "automation-security-group"
  identifier = "ssm.amazonaws.com"
  policy     = data.aws_iam_policy_document.security_group_access.json
}
