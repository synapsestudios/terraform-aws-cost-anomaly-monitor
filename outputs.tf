output "cost_anomaly_subscription_arn" {
  description = "ARN of the cost anomaly subscription that sends alerts to the SNS topic."
  value       = aws_ce_anomaly_subscription.this.arn
}
