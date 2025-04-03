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

