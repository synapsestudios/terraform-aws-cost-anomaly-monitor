resource "aws_ce_anomaly_monitor" "this" {
  name              = "AWSServiceMonitor-${var.environment}"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}

resource "aws_ce_anomaly_subscription" "this" {
  monitor_arn = aws_ce_anomaly_monitor.this.arn
  frequency   = "IMMEDIATE"

  monitor_arn_list = [
    aws_ce_anomaly_monitor.this.arn,
  ]

  name = "AWSServiceMonitorSubscription-${var.environment}"

  subscriber {
    type    = "SNS"
    address = var.sns_topic_arn
  }

  threshold_expression {
    dimension {
      key           = "ANOMALY_TOTAL_IMPACT_PERCENTAGE"
      values        = ["${var.threshold}"]
      match_options = ["GREATER_THAN_OR_EQUAL"]

    }
  }

  tags = var.tags

}
