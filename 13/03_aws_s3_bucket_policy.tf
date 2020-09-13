resource "aws_s3_bucket_policy" "config_log" {
  bucket     = module.config_log_bucket.name
  policy     = data.aws_iam_policy_document.config_log.json
  depends_on = [module.config_log_bucket]
}
