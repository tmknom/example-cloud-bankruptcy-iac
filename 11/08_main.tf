module "alternative_ec2" {
  source     = "./iam_role_module"
  name       = "alternative-ec2"
  identifier = "ec2.amazonaws.com"
  policy     = data.aws_iam_policy_document.alternative_ec2.json
}

data "aws_iam_policy_document" "alternative_ec2" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}
