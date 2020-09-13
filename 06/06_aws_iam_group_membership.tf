resource "aws_iam_group_membership" "admin" {
  name  = aws_iam_group.admin.name
  group = aws_iam_group.admin.name
  users = [aws_iam_user.terraform.name]
}
