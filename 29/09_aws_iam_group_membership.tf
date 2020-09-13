resource "aws_iam_group_membership" "assumable" {
  name  = aws_iam_group.assumable.name
  group = aws_iam_group.assumable.name
  users = [aws_iam_user.base.name]
}
