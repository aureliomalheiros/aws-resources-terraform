## Requirements

[![Pre-commit Terraform](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/terraform-lint.yaml/badge.svg?branch=main)](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/terraform-lint.yaml)

---
**K8S**
---

I created folders to apply resources.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_instance.k8s_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_security_group.k8s](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/security_group) | data source |
| [aws_subnet.network_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Associate a public ip address with an instance in a VPC | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone to create the instance in | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to start | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name to use for the instance | `string` | n/a | yes |
| <a name="input_tags_instance"></a> [tags\_instance](#input\_tags\_instance) | A mapping of tags to assign to the resource | `map(string)` | `{}` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the volume in gigabytes | `number` | `10` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of the volume | `string` | `"gp3"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | n/a |


## Example

```terraform
module "k8s" {
  source            = "git@github.com:aureliomalheiros/aws-modules-terraform.git//k8s/"
  count             = #NUMBERS OF INSTANCES
  key_name          = "KEY_NAME.PEM"
  availability_zone = "us-east-1a"
  instance_type     = "INSTANCE_TYPE"
  tags_instance     = { 
    #YOUR TAGS
  }
}

```

> [!Important]
> In tags you can use directaly in module, but its possible create file varibles.tf or vars.tfvars

For example:

`variables.tf`

```terraform
variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    Name        = "YOUR NAME"
    Environment = "Dev"
    Created     = "Tribix"
  }
}
```