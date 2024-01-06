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
  key_name               = local.instances_control_plane.key_name
  instance_type          = local.instances_control_plane.instance_type
  tags                   = local.instances_control_plane.tags
}

resource "aws_instance" "k8s_instance_workers" {
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
  key_name               = local.instances_workers.key_name
  instance_type          = local.instances_workers.instance_type
  tags                   = local.instances_workers.tags
}
