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
    key_name                    = "cluster-k8s"
    instance_type               = "t3a.small"
    tags                        = {
        Name = "k8s-instance-control-plane",
        Server = "Control Plane",
        Env = "Hello World"
    }
  }
  instances_control_plane = {
    ami                         = data.aws_ami.ubuntu.id
    worker_count                = 1
    availability_zone           = "us-east-1a"
    subnet_id                   = "subnet-03bda73c3706511b9"
    associate_public_ip_address = true
    volume_size                 = 10
    volume_type                 = "gp3"
    enable_dns_a_record         = true
    vpc_security_group_ids      = ["sg-030b02d63f0588700"]
    key_name                    = "cluster-k8s"
    instance_type               = "t3a.small"
    tags                        = {
        Name = "k8s-instance-workers",
        Server = "workers",
        Env = "Hello World"
    }
  }
}