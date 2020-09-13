module "virginia" {
  source = "./guardduty_module"

  providers = {
    aws = aws.virginia
  }
}
