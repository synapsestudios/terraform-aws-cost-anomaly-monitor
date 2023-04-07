variable "tags" {
  type = map(string)
  default = {
    "ProvisionedBy" = "terraform"
    "Environment"   = "dev"
    "Module"        = "terraform-aws-cost-explorer-anomaly-monitor"
  }
  description = "Tags to apply to all resources created, see internal documentation for tagging standards"
}

variable "sns_topic_arn" {
  type        = string
  description = "The ARN of the SNS topic to send notifications to"
}

variable "threshold" {
  type        = string
  default     = "10"
  description = "Value between 0 and 100 representing the percentage of impact to trigger an alert"
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "The environment this module is being deployed to"
}
