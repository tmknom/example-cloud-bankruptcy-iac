module "cloudtrail_log_bucket" {
  source = "./log_bucket_module"
  name   = "cloudtrail-log-cloud-bankruptcy-iac"
}
