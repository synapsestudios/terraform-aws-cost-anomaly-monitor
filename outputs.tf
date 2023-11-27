output "cost_anomaly_arn" {
  value = var.type == "account" ? aws_ce_anomaly_subscription.account[0].arn : aws_ce_anomaly_subscription.service[0].arn
}
