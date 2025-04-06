resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr
  instance_tenancy = var.vpc_tenancy

  enable_dns_support = var.dns_support
  enable_dns_hostnames = var.dns_hostnames

  tags = var.vpc_tags
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  for_each = local.public_subnet_cidr
  cidr_block = each.value
  availability_zone = local.selected_public_azs[ tonumber(each.key) % length(local.selected_public_azs) ]
  map_public_ip_on_launch = true
  tags = var.vpc_tags
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  for_each = local.private_subnet_cidr
  cidr_block = each.value
  availability_zone = local.selected_private_azs[ tonumber(each.key) % length(local.selected_private_azs) ]
  tags = var.vpc_tags
}