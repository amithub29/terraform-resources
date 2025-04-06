output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "input_cidr" {
  value = var.cidr
}

output "usable_cidr_block" {
  value = local.usable_cidr_block
}

output "reserved_cidr_block" {
  value = local.reserved_cidr_block
}

output "selected_private_azs" {
  value = local.selected_private_azs
}

output "selected_public_azs" {
  value = local.selected_public_azs
}

output "public_subnet_cidr" {
  value = local.public_subnet_cidr
}

output "private_subnet_cidr" {
  value = local.private_subnet_cidr
}
