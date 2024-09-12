provider "aws" {}


resource "aws_instance" "tf-ec2-demo" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

# create_before_destroy lifecycle meta argument create resource before destroying it if replacement is required
  
  lifecycle {
    create_before_destroy = true
  }
}
