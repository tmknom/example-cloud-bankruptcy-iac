module "cloud_trail_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "cloud-trail-changes"
  threshold = 1
  pattern   = "{($.eventName=CreateTrail) || ($.eventName=UpdateTrail) || ($.eventName=DeleteTrail) || ($.eventName=StartLogging) || ($.eventName=StopLogging)}"
}
