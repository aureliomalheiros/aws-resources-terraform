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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | Associate a public ip address with an instance in a VPC | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | The availability zone to create the instance in | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance to start | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | The key name to use for the instance | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | ID of the my subnet | `string` | n/a | yes |
| <a name="input_tags_instance"></a> [tags\_instance](#input\_tags\_instance) | A mapping of tags to assign to the resource | `string` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the volume in gigabytes | `number` | `10` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of the volume | `string` | `"gp3"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to enable on the EC2 instance | `list(string)` | `[]` | no |
| <a name="input_worker_count"></a> [worker\_count](#input\_worker\_count) | Number instances of workers | `number` | `1` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_control_plane_instance_id"></a> [control\_plane\_instance\_id](#output\_control\_plane\_instance\_id) | The ID of the control plane instance |
| <a name="output_control_plane_public_ip"></a> [control\_plane\_public\_ip](#output\_control\_plane\_public\_ip) | The public IP address of the control plane instance |
| <a name="output_worker_instance_ids"></a> [worker\_instance\_ids](#output\_worker\_instance\_ids) | The IDs of the worker instances |
| <a name="output_worker_public_ips"></a> [worker\_public\_ips](#output\_worker\_public\_ips) | The public IP addresses of the worker instances |

## Example

```terraform 
module "k8s" {
  source                 = "git@github.com:aureliomalheiros/aws-modules-terraform.git//k8s"
  worker_count           = NUMEBERS_OF_WORKERS
  key_name               = "YOUR_PEM"
  availability_zone      = "us-east-1a"
  instance_type          = "TYPE"
  tags_instance          = "CREATE_TAG_OR_TAGS"
  subnet_id              = "SUBNET_ID"
  vpc_security_group_ids = ["SG_ID]
}

```