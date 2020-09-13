module "aws_config_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "aws-config-changes"
  threshold = 1
  pattern   = "{($.eventSource=config.amazonaws.com) && (($.eventName=StopConfigurationRecorder) || ($.eventName=DeleteDeliveryChannel) || ($.eventName=PutDeliveryChannel) || ($.eventName=PutConfigurationRecorder))}"
}
