# terraform-module-template

A starter template for creating Terraform Modules

## Usage

```hcl
module "example" {
    source = "github.com/synapsestudios/terraform-module-template"

    example = "Hello World"
}
```

## Example Specific Usage

```hcl
module "example" {
    source = "github.com/synapsestudios/terraform-module-template"

    foo = "bar"
    example = "Hello World"}
```

_Hidden TF Docs Injection Comment below (**delete me I'm just an example**)_

**DO NOT DELETE `<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_example"></a> [example](#provider\_example) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [example_resource.example](https://registry.terraform.io/providers/hashicorp/example/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_example"></a> [example](#input\_example) | Example variable | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_example"></a> [example](#output\_example) | n/a |
<!-- END_TF_DOCS -->`**

<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                                         | Version |
| ------------------------------------------------------------ | ------- |
| <a name="provider_example"></a> [example](#provider_example) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                 | Type     |
| -------------------------------------------------------------------------------------------------------------------- | -------- |
| [example_resource.example](https://registry.terraform.io/providers/hashicorp/example/latest/docs/resources/resource) | resource |

## Inputs

| Name                                                   | Description      | Type     | Default | Required |
| ------------------------------------------------------ | ---------------- | -------- | ------- | :------: |
| <a name="input_example"></a> [example](#input_example) | Example variable | `string` | n/a     |   yes    |

## Outputs

| Name                                                     | Description |
| -------------------------------------------------------- | ----------- |
| <a name="output_example"></a> [example](#output_example) | n/a         |

<!-- END_TF_DOCS -->
