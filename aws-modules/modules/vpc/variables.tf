variable "cidr" {
  description = "VPC CIDR"
  type = string
}

variable "vpc_tags" {
  description = "A map of tags to apply to vpc"
  type        = map(string)
  default     = {}
}

variable "vpc_tenancy" {
  description = "VPC instance tenancy: default | dedicated"
  type        = string
  default     = "default"
  validation {
    condition = contains(["default", "dedicated"], var.vpc_tenancy)
    error_message = "Tenance should be either 'default' or 'dedicated'"
  }
}

variable "dns_support" {
  description = "enable_dns_support: true | false"
  type = bool
  default = true
}

variable "dns_hostnames" {
  description = "enable_dns_hostnames: true | false"
  type = bool
  default = true
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type = number
  default = 2
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type = number
  default = 2
}

variable "public_subnet_az_names" {
  description = "Preffered availability zones for public subnet"
  type = list(string)
  default = []
  validation {
    condition = length(var.public_subnet_az_names) <= var.public_subnet_count
    error_message = "Specified AZs can't be more than number of public subnets"
  }
}

variable "private_subnet_az_names" {
  description = "Preffered availability zones for private subnet"
  type = list(string)
  default = []
  validation {
    condition = length(var.private_subnet_az_names) <= var.private_subnet_count
    error_message = "Specified AZs can't be more than number of private subnets"
  }
}


