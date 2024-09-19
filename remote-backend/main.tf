terraform {
  backend "s3" {
    bucket = "terraform-backend-8913-7735-5669"
    key    = "compute/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "tf-ec2-s3-backend" {
  ami           = var.ami-id
  instance_type = var.instance-type

  tags = {
    Name = var.tag-name
  }
}

output "instance_public_ip" {
  value = "http://${aws_instance.tf-ec2-s3-backend.public_ip}:80/index.html"
}

output "instance_public_dns" {
  value = "http://${aws_instance.tf-ec2-s3-backend.public_dns}:80/index.html"
}
