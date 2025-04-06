data "aws_availability_zones" "available" {}

locals {

  # Split VPC CIDR into 2 blocks: one for use, one reserved
  usable_cidr_block = cidrsubnet(var.cidr, 1, 0) # First block
  reserved_cidr_block = cidrsubnet(var.cidr, 1, 1) # Second block reserved for future
  
  # Setting the AZs for public and private subnet
  selected_public_azs = length(var.public_subnet_az_names) > 0 ? var.public_subnet_az_names : slice(data.aws_availability_zones.available.names, 0, min(var.public_subnet_count, length(data.aws_availability_zones.available.names)))
  selected_private_azs = length(var.private_subnet_az_names) > 0 ? var.private_subnet_az_names : slice(data.aws_availability_zones.available.names, 0, min(var.private_subnet_count, length(data.aws_availability_zones.available.names)))

  # Calculating the subnet CIDR
  total_subnet = var.public_subnet_count + var.private_subnet_count
  bit_list = [ for i in range(7) : i if pow(2, i) > local.total_subnet ]
  min_bit = local.bit_list[0]
  public_subnet_cidr = [ for i in range(var.public_subnet_count) : cidrsubnet(local.usable_cidr_block, local.min_bit, i) ]
  private_subnet_cidr = [ for i in range(var.private_subnet_count) : cidrsubnet(local.usable_cidr_block, local.min_bit, i + var.public_subnet_count) ]

}

