locals {
  instances_workers = {
    ami                         = data.aws_ami.ubuntu.id
    worker_count                = 1
    availability_zone           = "us-east-1a"
    subnet_id                   = "subnet-03bda73c3706511b9"
    associate_public_ip_address = true
    volume_size                 = 10
    volume_type                 = "gp3"
    enable_dns_a_record         = true
    vpc_security_group_ids      = ["sg-030b02d63f0588700"]
    instance_type               = "t3a.small"
    tags = {
      Server = "Workers",
      Env    = "Hello World"
    }
    config_workers = [
      "chmod +x /tmp/workers.sh",
      "sudo /tmp/workers.sh args"
    ]
    shared_token = [
      "curl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"",
      "sudo apt install -y unzip",
      "unzip awscliv2.zip",
      "sudo ./aws/install",
      "aws s3 cp s3://clusters-k8s-terraform/token.sh token.sh"
    ]
    connect_cluster = [
      "sudo bash token.sh"
    ]
  }

  instances_control_plane = {
    ami                         = data.aws_ami.ubuntu.id
    availability_zone           = "us-east-1a"
    subnet_id                   = "subnet-03bda73c3706511b9"
    associate_public_ip_address = true
    volume_size                 = 10
    volume_type                 = "gp3"
    enable_dns_a_record         = true
    vpc_security_group_ids      = ["sg-030b02d63f0588700"]
    instance_type               = "t3a.small"
    tags = {
      Name   = "k8s-instance-control-plane",
      Server = "Control Plane",
      Env    = "Hello World"
    }
    config_control_plane = [
      "chmod +x /tmp/control-plane.sh",
      "sudo /tmp/control-plane.sh args",
      "kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.26.0/manifests/calico.yaml"
    ]
    shared_token = [
      "curl \"https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip\" -o \"awscliv2.zip\"",
      "sudo apt install -y unzip",
      "unzip awscliv2.zip",
      "sudo ./aws/install",
      "aws s3 cp token.sh s3://clusters-k8s-terraform/token.sh"
    ]
  }

  bucket = {
    name = "clusters-k8s-terraform"
    tags = {
      Name     = "clusters-k8s-terraform",
      Resource = "bucket",
      Env      = "Hello World"
    }
  }

  iam = {
    Name               = "s3_policy_ec2"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
    policy_arn         = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  }
}