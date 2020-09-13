resource "aws_iam_policy" "rotate_access_key_access" {
  name   = "rotate-access-key-access"
  policy = data.aws_iam_policy_document.rotate_access_key_access.json
}
