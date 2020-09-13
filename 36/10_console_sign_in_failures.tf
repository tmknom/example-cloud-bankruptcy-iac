module "console_sign_in_failures" {
  source    = "./cloudwatch_alarms_module"
  name      = "console-sign-in-failures"
  threshold = 3
  pattern   = "{($.eventName = ConsoleLogin) && ($.errorMessage = \"Failed authentication\")}"
}
