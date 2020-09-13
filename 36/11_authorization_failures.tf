module "authorization_failures" {
  source    = "./cloudwatch_alarms_module"
  name      = "authorization-failures"
  threshold = 3
  pattern   = "{($.errorCode = \"*UnauthorizedOperation\") || ($.errorCode = \"AccessDenied*\")}"
}
