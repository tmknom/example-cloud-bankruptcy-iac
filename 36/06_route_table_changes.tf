module "route_table_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "route-table-changes"
  threshold = 1
  pattern   = "{($.eventName=CreateRoute) || ($.eventName=CreateRouteTable) || ($.eventName=ReplaceRoute) || ($.eventName=ReplaceRouteTableAssociation) || ($.eventName=DeleteRouteTable) || ($.eventName=DeleteRoute) || ($.eventName=DisassociateRouteTable)}"
}
