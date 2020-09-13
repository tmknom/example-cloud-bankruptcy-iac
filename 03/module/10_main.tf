module "use_iam_user_module" {
  source    = "./iam_user_module"
  user_name = "terraform"
}

output "arn" {
  value = module.use_iam_user_module.arn
}
