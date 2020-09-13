locals {
  create_table = templatefile("${path.module}/create_table.sql", {
    database_name = aws_athena_database.security_log.name
    table_name    = "cloudtrail"
    bucket_name   = data.aws_s3_bucket.cloudtrail_log.id
    account_id    = data.aws_caller_identity.current.account_id
    regions       = join(",", data.aws_regions.current.names)
  })
}

data "aws_s3_bucket" "cloudtrail_log" {
  bucket = "cloudtrail-log-cloud-bankruptcy-iac"
}

data "aws_caller_identity" "current" {}
data "aws_regions" "current" {}
