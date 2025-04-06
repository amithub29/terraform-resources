data "aws_availability_zones" "available" {}

locals {

  # Split VPC CIDR into 2 blocks: one for use, one reserved
  usable_cidr_block = cidrsubnet(var.cidr, 1, 0) # First block
  reserved_cidr_block = cidrsubnet(var.cidr, 1, 1) # Second block reserved for future

  selected_public_azs = length(var.public_subnet_az_names) > 0 ? var.public_subnet_az_names : slice(data.aws_availability_zones.available.names, 0, min(var.public_subnet_count, length(data.aws_availability_zones.available.names)))
  selected_private_azs = length(var.private_subnet_az_names) > 0 ? var.private_subnet_az_names : slice(data.aws_availability_zones.available.names, 0, min(var.private_subnet_count, length(data.aws_availability_zones.available.names)))

}

