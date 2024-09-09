provider "aws" {}

# Conditional expression to decide the instance type based on variable values
# Can use && || to combine conditions and != for negation

resource "aws_instance" "ec2-instances" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = var.environment == "prod" && var.region == "us-east-1" ? "m5.large" : "t2.micro"
}

variable "environment" {
  default = "prod"
}

variable "region" {
  default = "us-east-1"
}
