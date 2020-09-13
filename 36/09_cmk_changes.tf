module "cmk_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "cmk-changes"
  threshold = 1
  pattern   = "{($.eventSource=kms.amazonaws.com) && (($.eventName=DisableKey) || ($.eventName=ScheduleKeyDeletion))}"
}
