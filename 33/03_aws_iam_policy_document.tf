data "aws_iam_policy_document" "assume_role_access" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    resources = [
      data.aws_iam_role.readonly.arn,
      data.aws_iam_role.admin.arn,
    ]
  }
}

data "aws_iam_role" "readonly" {
  name = "readonly"
}

data "aws_iam_role" "admin" {
  name = "admin"
}
