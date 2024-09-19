terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">=5.66.0"
    }
  }
}

resource "aws_instance" "tf-ec2-instance" {
  ami = var.ami
  instance_type = var.instance_type
  
  tags = {
    Name = var.tag-name
  }
}
