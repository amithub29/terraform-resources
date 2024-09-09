provider "aws" {}

# resource block denotes the resource type you can create and it is provider specific
resource "aws_instance" "tf-ec2-demo" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  
  tags = {
    Name = "tf-ec2"
  }
}
