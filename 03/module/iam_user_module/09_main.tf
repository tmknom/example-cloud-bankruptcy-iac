variable "user_name" {}

resource "aws_iam_user" "this" {
  name = "example-${var.user_name}"
}

output "arn" {
  value = aws_iam_user.this.arn
}
