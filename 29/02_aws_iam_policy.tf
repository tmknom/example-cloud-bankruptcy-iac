resource "aws_iam_policy" "assume_role_access" {
  name   = "assume-role-access"
  policy = data.aws_iam_policy_document.assume_role_access.json
}
