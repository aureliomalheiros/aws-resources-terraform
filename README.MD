## Requirements

[![Pre-commit Terraform](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/terraform-lint.yaml/badge.svg?branch=main)](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/terraform-lint.yaml)
[![Release my repository](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/release.yml/badge.svg)](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/release.yml)
[![Stable Version](https://img.shields.io/github/v/tag/aureliomalheiros/aws-modules-terraform)](https://img.shields.io/github/v/tag/aureliomalheiros/aws-modules-terraform)
[![Latest Release](https://img.shields.io/github/v/release/aureliomalheiros/aws-modules-terraform?color=%233D9970)](https://img.shields.io/github/v/release/aureliomalheiros/aws-modules-terraform?color=%233D9970)


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
| [aws_instance.k8s_instance_control_plane](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.k8s_instance_workers](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
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
| <a name="input_tags_instance"></a> [tags\_instance](#input\_tags\_instance) | A mapping of tags to assign to the resource | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the volume in gigabytes | `number` | `10` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of the volume | `string` | `"gp3"` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | Number instances of workers | `number` | `1` | no |

## Outputs

No outputs.