resource "aws_iam_role_policy_attachment" "tokyo" {
  role       = aws_iam_role.regional.name
  policy_arn = aws_iam_policy.tokyo_access.arn
}

resource "aws_iam_role_policy_attachment" "virginia" {
  role       = aws_iam_role.regional.name
  policy_arn = aws_iam_policy.virginia_access.arn
}

resource "aws_iam_role_policy_attachment" "ohio" {
  role       = aws_iam_role.regional.name
  policy_arn = aws_iam_policy.ohio_access.arn
}
