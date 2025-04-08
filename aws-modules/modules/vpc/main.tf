resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr
  instance_tenancy = var.vpc_tenancy

  enable_dns_support   = var.dns_support
  enable_dns_hostnames = var.dns_hostnames

  tags = merge({ "Project" : "${var.project_name}", "Name" : "${var.project_name}-VPC" }, var.vpc_tags)
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.vpc.id
  for_each                = local.public_subnet_cidr
  cidr_block              = each.value
  availability_zone       = local.selected_public_azs[tonumber(each.key) % length(local.selected_public_azs)]
  map_public_ip_on_launch = true
  tags                    = merge({ "Project" : "${var.project_name}", "Name" : "${var.project_name}-public-subnet" }, var.vpc_tags)
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.vpc.id
  for_each          = local.private_subnet_cidr
  cidr_block        = each.value
  availability_zone = local.selected_private_azs[tonumber(each.key) % length(local.selected_private_azs)]
  tags              = merge({ "Project" : "${var.project_name}", "Name" : "${var.project_name}-private-subnet" }, var.vpc_tags)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge({ "Project" : "${var.project_name}", "Name" : "${var.project_name}-IGW" }, var.vpc_tags)
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = merge({ "Project" : "${var.project_name}", "Name" : "${var.project_name}-public-RT" }, var.vpc_tags)
}

resource "aws_route_table_association" "public-subnet-igw" {
  for_each       = aws_subnet.public_subnet
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

