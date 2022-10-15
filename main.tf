resource "aws_cloudwatch_metric_stream" "this" {
  name          = "newrelic-metric-stream"
  role_arn      = aws_iam_role.metric_stream_to_firehose.arn
  firehose_arn  = aws_kinesis_firehose_delivery_stream.newrelic_firehost_stream.arn
  output_format = "opentelemetry0.7"

  dynamic "include_filter" {
    for_each = var.namespace

    content {
      namespace = namespace.value
    }
  }
}
