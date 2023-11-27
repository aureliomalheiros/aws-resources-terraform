resource "aws_vpc" "vpc" {
  cidr_block        = var.cidr_block_vpc
  enable_dns_support    = var.enable_dns_support
  enable_dns_hostnames = var.enabled_dns_hostnames
  tags                  = var.tags
}

//Subnets
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block_subnet

  tags = var.tags
}
//Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id
  tags   = var.tags
}