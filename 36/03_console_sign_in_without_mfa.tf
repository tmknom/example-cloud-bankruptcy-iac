module "console_sign_in_without_mfa" {
  source    = "./cloudwatch_alarms_module"
  name      = "console-sign-in-without-mfa"
  threshold = 1
  pattern   = "{($.eventName=\"ConsoleLogin\") && ($.additionalEventData.MFAUsed !=\"Yes\")}"
}
