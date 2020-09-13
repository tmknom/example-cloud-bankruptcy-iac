resource "null_resource" "create_table" {
  provisioner "local-exec" {
    command = <<EOT
      aws athena start-query-execution --result-configuration \
      OutputLocation=s3://${module.athena_query_result_bucket.name} \
      --query-string "${local.create_table}"
    EOT
  }

  triggers = {
    create_table = local.create_table
  }
}
