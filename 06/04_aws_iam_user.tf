resource "aws_iam_user" "terraform" {
  name          = "terraform"
  force_destroy = true
}
