resource "aws_iam_user" "base" {
  name          = "base"
  force_destroy = true
}
