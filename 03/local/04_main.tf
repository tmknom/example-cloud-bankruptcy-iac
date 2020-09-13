locals {
  user_name = "example"
}

resource "aws_iam_user" "example" {
  name = local.user_name
}
