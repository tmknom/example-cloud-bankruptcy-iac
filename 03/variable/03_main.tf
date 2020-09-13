variable "user_name" {
  default = "example"
}

resource "aws_iam_user" "example" {
  name = var.user_name
}
