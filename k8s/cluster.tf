resource "aws_instance" "k8s_instance_control_plane" {
  ami                         = data.aws_ami.ubuntu.id
  availability_zone           = local.instances_control_plane.availability_zone
  subnet_id                   = local.instances_control_plane.subnet_id
  associate_public_ip_address = local.instances_control_plane.associate_public_ip_address
  root_block_device {
    volume_size = local.instances_control_plane.volume_size
    volume_type = local.instances_control_plane.volume_type
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record = true
  }
  vpc_security_group_ids = local.instances_control_plane.vpc_security_group_ids
  key_name               = aws_key_pair.k8s.key_name
  instance_type          = local.instances_control_plane.instance_type
  tags                   = local.instances_control_plane.tags
  iam_instance_profile   = aws_iam_instance_profile.this.name
  connection {
    type        = "ssh"
    user        = "ubuntu"
    agent       = false
    private_key = file("~/.ssh/terraform")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "scripts/control-plane.sh"
    destination = "/tmp/control-plane.sh"
  }
  provisioner "remote-exec" {
    inline = local.instances_control_plane.config_control_plane
  }
  provisioner "remote-exec" {
    inline = local.instances_control_plane.shared_token
  }
}

resource "aws_instance" "k8s_instance_workers" {
  count                       = local.instances_workers.worker_count
  ami                         = data.aws_ami.ubuntu.id
  availability_zone           = local.instances_workers.availability_zone
  subnet_id                   = local.instances_workers.subnet_id
  associate_public_ip_address = local.instances_workers.associate_public_ip_address
  root_block_device {
    volume_size = local.instances_workers.volume_size
    volume_type = local.instances_workers.volume_type
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record = true
  }
  vpc_security_group_ids = local.instances_workers.vpc_security_group_ids
  key_name               = aws_key_pair.k8s.key_name
  instance_type          = local.instances_workers.instance_type
  tags                   = merge(
    local.instances_workers.tags,
    {
      "Name" = format("k8s-instance-workers-%d", count.index)
    }
  )
  iam_instance_profile   = aws_iam_instance_profile.this.name

  connection {
    type        = "ssh"
    user        = "ubuntu"
    agent       = false
    private_key = file("~/.ssh/terraform")
    host        = self.public_ip
  }

  provisioner "file" {
    source      = "scripts/workers.sh"
    destination = "/tmp/workers.sh"
  }
  provisioner "remote-exec" {
    inline = local.instances_workers.config_workers
  }
  provisioner "remote-exec" {
    inline = local.instances_workers.shared_token
  }
  provisioner "remote-exec" {
    inline = local.instances_workers.connect_cluster
  }
  depends_on = [
    aws_instance.k8s_instance_control_plane
  ]
}

###################################
# KEY PAIR                        #
###################################

resource "aws_key_pair" "k8s" {
  key_name   = "k8s"
  public_key = file("~/.ssh/terraform.pub")
}

###################################
# S3                              #
###################################

resource "aws_s3_bucket" "example" {
  bucket        = local.bucket.name
  tags          = local.bucket.tags
  force_destroy = true
}