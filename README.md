# Terraform AWS Cost Anomaly Monitor

A Terraform module to create an AWS Cost Anomaly Monitor.

## Requirements

To use this module, you need to ensure the SNS topic you pass contains this statement in it's policy:

```hcl
data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "sns_topic_policy"

  statement {
    sid = "AWSAnomalyDetectionSNSPublishingPermission"

    actions = [
      "SNS:Publish",
    ]

    principals {
      type        = "Service"
      identifiers = ["costalerts.amazonaws.com"]
    }

    resources = [
      aws_sns_topic.example.arn,
    ]
  }
}
```

## Usage

```hcl
module "example" {
    source = "github.com/synapsestudios/terraform-aws-cost-anomaly-monitor"

    threshold = "10"
    environment = "production"
    sns_topic_arn = aws_sns_topic.example.arn

    tags = {
        "ProvisionedBy" = "terraform"
        "Environment"   = "production"
        "Module"        = "terraform-aws-cost-explorer-anomaly-monitor"
    }
}
```

## Resource Graph

<img src="./graph.svg">

<!-- BEGIN_TF_DOCS -->

<!-- END_TF_DOCS -->
