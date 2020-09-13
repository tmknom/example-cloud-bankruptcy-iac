resource "aws_iam_role" "readonly" {
  name               = "readonly"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}
