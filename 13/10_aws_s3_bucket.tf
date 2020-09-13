resource "aws_s3_bucket" "force_destroy" {
  bucket        = "force-destroy-cloud-bankruptcy-iac"
  force_destroy = true
}
