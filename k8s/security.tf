###############################################
#Create all resource about security in the file
#Security and Groups ACLs
################################################

resource "aws_security_group" "allow_tls" {
  for_each = var.security_groups

  vpc_id = aws_vpc.main.id

  name        = each.value.name
  description = each.value.description
  ingress     = each.value.ingress
  egress      = each.value.egress
  tags        = each.value.tags
}

resource "aws_network_acl" "main" {
  for_each = var.network_acl
  vpc_id   = aws_vpc.main.id

  egress  = each.value.egress
  ingress = each.value.ingress
  tags    = each.value.tags
}