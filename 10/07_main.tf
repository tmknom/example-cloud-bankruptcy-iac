module "alternative_log" {
  source = "./log_bucket_module"
  name   = "alternative-log-cloud-bankruptcy-iac"
}

resource "aws_s3_bucket_policy" "alternative_log" {
  bucket     = module.alternative_log.name
  policy     = data.aws_iam_policy_document.alternative_log.json
  depends_on = [module.alternative_log]
}

data "aws_iam_policy_document" "alternative_log" {
  statement {
    effect    = "Deny"
    actions   = ["s3:*"]
    resources = ["${module.alternative_log.arn}/*"]

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
