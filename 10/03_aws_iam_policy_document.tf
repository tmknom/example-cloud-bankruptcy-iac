data "aws_iam_policy_document" "log" {
  statement {
    effect    = "Deny"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.log.arn}/*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    condition {
      test     = "NotIpAddress"
      variable = "aws:SourceIp"
      values   = ["192.0.2.1/32"]
    }
  }
}
