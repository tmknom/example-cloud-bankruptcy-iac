resource "aws_athena_database" "security_log" {
  name   = "security_log"
  bucket = module.athena_query_result_bucket.name
}
