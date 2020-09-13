resource "aws_iam_role" "ec2" {
  name               = "ec2"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}
