resource "aws_instance" "k8s_instance" {
  ami                         = data.aws_ami.ubuntu.id
  availability_zone           = var.availability_zone
  subnet_id                   = data.aws_subnet.network_subnet.id
  associate_public_ip_address = var.associate_public_ip_address
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }
  private_dns_name_options {
    enable_resource_name_dns_a_record = true
  }
  security_groups = [data.aws_security_group.k8s.id]
  key_name        = var.key_name
  instance_type   = var.instance_type
  tags            = var.tags_instance
}
