resource "aws_iam_group_policy_attachment" "assume_role_access" {
  group      = aws_iam_group.assumable.name
  policy_arn = aws_iam_policy.assume_role_access.arn
}
