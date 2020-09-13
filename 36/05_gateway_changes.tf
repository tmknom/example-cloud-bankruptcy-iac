module "gateway_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "gateway-changes"
  threshold = 1
  pattern   = "{($.eventName=CreateCustomerGateway) || ($.eventName=DeleteCustomerGateway) || ($.eventName=AttachInternetGateway) || ($.eventName=CreateInternetGateway) || ($.eventName=DeleteInternetGateway) || ($.eventName=DetachInternetGateway)}"
}
