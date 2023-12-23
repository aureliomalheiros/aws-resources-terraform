###########################################
#In this file are configuration of network
#VPC, Routes, GWs, Subnets
###########################################


resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags                 = var.tags_network
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = var.tags_network
}

resource "aws_route_table" "route_internet" {
  vpc_id = aws_vpc.example.id

  route {
    cidr_block = aws_subnet.public.cidr_block
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = var.tags_network
}

resource "aws_subnet" "public" {
  vpc_id                                      = aws_vpc.main.id
  cidr_block                                  = "10.1.1.0/24"
  availability_zone                           = "us-east-1"
  enable_dns64                                = true
  enable_resource_name_dns_a_record_on_launch = true
  map_public_ip_on_launch                     = true
  tags                                        = var.tags_network
}

resource "aws_subnet" "private" {
  vpc_id                                      = aws_vpc.main.id
  cidr_block                                  = "10.1.2.0/24"
  availability_zone                           = "us-east-1"
  enable_dns64                                = true
  enable_resource_name_dns_a_record_on_launch = true
  tags                                        = var.tags_network
}