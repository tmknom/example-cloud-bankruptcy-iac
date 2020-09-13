module "network_acl_changes" {
  source    = "./cloudwatch_alarms_module"
  name      = "network-acl-changes"
  threshold = 1
  pattern   = "{($.eventName=CreateNetworkAcl) || ($.eventName=CreateNetworkAclEntry) || ($.eventName=DeleteNetworkAcl) || ($.eventName=DeleteNetworkAclEntry) || ($.eventName=ReplaceNetworkAclEntry) || ($.eventName=ReplaceNetworkAclAssociation)}"
}
