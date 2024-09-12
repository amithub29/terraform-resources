provider "aws" {}


resource "aws_instance" "tf-ec2-demo" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

# prevent_destroy lifecycle meta argument prevents Terraform from destroying resources 
  
  lifecycle {
    prevent_destroy = true
  }
}
