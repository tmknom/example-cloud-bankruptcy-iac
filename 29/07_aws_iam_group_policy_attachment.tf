resource "aws_iam_group_policy_attachment" "rotate_access_key_access" {
  group      = aws_iam_group.assumable.name
  policy_arn = aws_iam_policy.rotate_access_key_access.arn
}
