resource "aws_config_delivery_channel" "default" {
  name           = aws_config_configuration_recorder.default.name
  s3_bucket_name = module.config_log_bucket.name
  depends_on     = [aws_config_configuration_recorder.default]
}
