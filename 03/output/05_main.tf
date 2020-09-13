resource "aws_iam_user" "example" {
  name = "example"
}

output "iam_user_arn" {
  value = aws_iam_user.example.arn
}
