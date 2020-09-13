resource "aws_iam_user" "example" {
  name = "example"

  tags = {
    role = "developer"
  }
}
