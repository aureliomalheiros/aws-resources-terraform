resource "aws_vpc" "vpc" {
  cidr_block_vpc        = var.cidr_block_vpc
  enabled_dns_suport    = var.enabled_dns_suport
  enabled_dns_hostnames = var.enabled_dns_hostnames
  tags                  = var.tags
}

//Subnets
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.cidr_block_subnet

  tags = var.tags
}
//Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = var.tags
}