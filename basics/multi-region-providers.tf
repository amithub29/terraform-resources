provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

resource "aws_instance" "dev-ec2-us" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
}

resource "aws_instance" "dev-ec2-ap" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  provider      = aws.mumbai
}
