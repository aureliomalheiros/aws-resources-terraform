# AWS Resources with Terraform

## Requirements

[![Pre-commit Terraform](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/terraform-lint.yaml/badge.svg?branch=main)](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/terraform-lint.yaml)
[![Release my repository](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/release.yml/badge.svg)](https://github.com/aureliomalheiros/aws-modules-terraform/actions/workflows/release.yml)
[![Stable Version](https://img.shields.io/github/v/tag/aureliomalheiros/aws-modules-terraform)](https://img.shields.io/github/v/tag/aureliomalheiros/aws-modules-terraform)
[![Latest Release](https://img.shields.io/github/v/release/aureliomalheiros/aws-modules-terraform?color=%233D9970)](https://img.shields.io/github/v/release/aureliomalheiros/aws-modules-terraform?color=%233D9970)

---

### K8S Cluster Hello World

This repository contains Terraform configurations to set up AWS resources, including EC2 instances for a Kubernetes control plane and worker nodes.

#### Prerequisites

- Terraform 0.14+
- AWS account
- Private key

#### Usage

> Create private key:

```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/NAME_YOUR_SSH_KEY
```

Create file `.PEM`:

```bash
cp ~/.ssh/NAME_YOUR_SSH_KEY NAME_YOUR_SSH_KEY.pem
```

> [!Note]
> The file .pem use to connect services in AWS

> Navigate to the directory

```bash
cd aws-resources-terraform/k8s
```

> Initialize, plan and apply:

```bash
terraform init
```

``` bash
terraform plan
```

```bash
terraform apply
```

### Local values

In the `locals.tf` file, two local configurations are defined for worker and control plane instances on AWS EC2 using Terraform.

#### instances_workers

This local variable defines the configuration for the Kubernetes worker instances. It includes the following keys:

- ami: ID of the Amazon Machine Image (AMI) to be used for the instances
- worker_count: Number of worker instances to be created
- availability_zone: Availability zone in which the instances will be created
- subnet_id: ID of the subnet in which the instances will be created
- associate_public_ip_address: Whether the instances should have a public IP address associated
- volume_size: Size of the volume in GB
- volume_type: Type of the volume
- enable_dns_a_record: Whether a DNS record should be created for the instances
- vpc_security_group_ids: IDs of the security groups to be associated with the instances
- instance_type: Type of instance to be created
- tags: Tags to be associated with the instances
- config_workers: Commands to be executed on the worker instances
- shared_token: Commands to install the AWS CLI and copy a script from S3
- connect_cluster: Command to run the script downloaded from S3

#### instances_control_plane

This local variable defines the configuration for the Kubernetes control plane instances. It includes the following keys:

- ami: ID of the Amazon Machine Image (AMI) to be used for the instances
- availability_zone: Availability zone in which the instances will be created
- subnet_id: ID of the subnet in which the instances will be created
- associate_public_ip_address: Whether the instances should have a public IP address associated
- volume_size: Size of the volume in GB
- volume_type: Type of the volume
- enable_dns_a_record: Whether a DNS record should be created for the instances
- vpc_security_group_ids: IDs of the security groups to be associated with the instances
- instance_type: Type of instance to be created
- tags: Tags to be associated with the instances

#### bucket

This local variable defines the configuration for an S3 bucket, when storage token connection cluster.

- name: The name of the S3 bucket
- tags: Metadata to assign to the S3 bucket

#### Iam

This local variable defines the configuration for an IAM role.

- Name: The name of the IAM role
- assume_role_policy: The policy that grants an entity permission to assume the role. In this case, the
- policy allows the "ec2.amazonaws.com" service to assume the role
- policy_arn: The Amazon Resource Name (ARN) of the policy to attach to the IAM role. In this case, the policy grants full access to Amazon S3
  