resource "aws_ce_anomaly_monitor" "service" {
  count = var.type == "service" ? 1 : 0

  name              = "AWSServiceMonitor-${var.environment}"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
}

resource "aws_ce_anomaly_monitor" "account" {
  count = var.type == "account" ? 1 : 0

  lifecycle {
    precondition {
      condition     = length(var.account_list) > 0 && var.type == "account"
      error_message = "var.account_list must be defined if using the \"type\" input variable."
    }
  }

  name         = "AWSAccountCostMonitor-${var.environment}"
  monitor_type = "CUSTOM"
  monitor_specification = jsonencode({
    And            = null
    CostCategories = null
    Dimensions     = null
    Not            = null
    Or             = null

    Tags = {
      Key          = "user:LINKED_ACCOUNT"
      MatchOptions = null
      Values       = var.account_list
    }
  })
}

resource "aws_ce_anomaly_subscription" "this" {
  frequency = "IMMEDIATE"

  monitor_arn_list = [
    var.type == "account" ? aws_ce_anomaly_monitor.account[0].arn : aws_ce_anomaly_monitor.service[0].arn
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
