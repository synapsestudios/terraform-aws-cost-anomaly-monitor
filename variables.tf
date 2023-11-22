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

variable "account_list" {
  type        = list(string)
  default     = []
  description = "List of AWS account numbers to monitor for cost anomalies. Required if using \"type\" argument"

  validation {
    condition     = length(var.account_list) <= 10
    error_message = "The limit of linked accounts to monitor is 10. If you require more than this, add another instance of this module with the rest of the accounts"
  }
}

variable "type" {
  type        = string
  default     = "service"
  description = "The type of anomaly to detect for. Requires \"account_list\" argument. You won't be able to create a linked account monitor using this method from the linked account, the resource must be created in the parent account."

  validation {
    condition     = var.type == "account" || var.type == "service"
    error_message = "The value of \"type\" must be \"account\" or \"service\""
  }
}
