resource "aws_iam_policy" "admin_access" {
  name   = "admin-access"
  policy = data.aws_iam_policy_document.admin_access.json
}
