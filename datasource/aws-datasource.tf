provider "aws" {}

# Reading data from AWS at runtime using Datasource
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = [ "amazon" ]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Using data from datasource in resource provisioning
resource "aws_instance" "ec2-instance" {
  ami = data.aws_ami.ubuntu.image_id
  instance_type = "t2.micro"
}
