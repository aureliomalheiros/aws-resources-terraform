data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }


}

data "aws_vpc" "main" {
  tags = {
    Name = "network-vpc"
  }
}

data "aws_subnet" "network_subnet" {
  id = "subnet-03bda73c3706511b9"
}

data "aws_security_group" "k8s" {
  id = "sg-030b02d63f0588700"
}