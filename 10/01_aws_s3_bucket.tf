resource "aws_s3_bucket" "log" {
  bucket = "log-cloud-bankruptcy-iac"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}
