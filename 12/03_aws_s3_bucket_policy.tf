resource "aws_s3_bucket_policy" "cloudtrail_log" {
  bucket     = module.cloudtrail_log_bucket.name
  policy     = data.aws_iam_policy_document.cloudtrail_log.json
  depends_on = [module.cloudtrail_log_bucket]
}
