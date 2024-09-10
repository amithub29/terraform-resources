provider "aws" {}

resource "aws_instance" "ec2-instance" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  
  tags = {
    BU = local.business_unit
    Date = local.creation_date
  }
}

# Locals can be used if functions calls are needed to derive values
# Variables don't allow the use of functions
locals {
  business_unit = "retail"
  creation_date = formatdate("DD MMM YY", timestamp())
}
