module "athena_query_result_bucket" {
  source = "./log_bucket_module"
  name   = "athena-query-result-cloud-bankruptcy-iac"
}
