module "cloudtrail_iam_role" {
  source     = "./iam_role_module"
  name       = "cloudtrail"
  identifier = "cloudtrail.amazonaws.com"
  policy     = data.aws_iam_policy_document.cloudtrail.json
}
