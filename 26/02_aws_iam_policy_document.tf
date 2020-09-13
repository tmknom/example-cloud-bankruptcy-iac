data "aws_iam_policy_document" "security_group_access" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:RevokeSecurityGroupIngress"]
    resources = ["*"]
  }
}
