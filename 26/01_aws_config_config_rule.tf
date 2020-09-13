resource "aws_config_config_rule" "restricted_ssh" {
  name        = "restricted-ssh"
  description = "SSHポートがIPアドレス制限をしているか確認します。"

  source {
    owner             = "AWS"
    source_identifier = "INCOMING_SSH_DISABLED"
  }

  scope {
    compliance_resource_types = [
      "AWS::EC2::SecurityGroup"
    ]
  }
}
