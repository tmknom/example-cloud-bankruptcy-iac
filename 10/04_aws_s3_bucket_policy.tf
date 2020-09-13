resource "aws_s3_bucket_policy" "log" {
  bucket     = aws_s3_bucket.log.id
  policy     = data.aws_iam_policy_document.log.json
  depends_on = [aws_s3_bucket_public_access_block.log]
}
