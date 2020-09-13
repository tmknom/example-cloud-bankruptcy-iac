resource "aws_iam_role" "regional" {
  name               = "regional"
  assume_role_policy = data.aws_iam_policy_document.regional.json
}
