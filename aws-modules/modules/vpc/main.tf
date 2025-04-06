resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr
  instance_tenancy = var.vpc_tenancy

  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostnames

  tags = var.vpc_tags
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id

  for_each = 
  cidr_block = var.subnet_cidr

  tags = {
    Name = "Main"
  }
}