provider "aws" {}

# Reading data from AWS at runtime using Datasource
data "aws_ami" "amazon_linux" {

  most_recent = true
}

# Using data from datasource in resource provisioning
resource "aws_instance" "ec2-instance" {
  ami = data.aws_ami.amazon_linux.image_id
  instance_type = "t2.micro"
}
