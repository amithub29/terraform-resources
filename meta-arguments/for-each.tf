provider "aws" {}

# Using for_each meta argument to create multiple users with set as input
resource "aws_iam_user" "the-accounts" {
  for_each = toset(["Todd", "James", "Alice", "Dottie"])
  name     = each.key
}

# Using for_each meta argument to create multiple instances with map as input
resource "aws_instance" "ec2-instances" {
  ami = "ami-0e731c8a588258d0d"
  for_each = tomap({
    small = "t2.micro"
    large = "t2.large"
  })
  instance_type = each.value
  
  tags = {
    size = each.key
  }
}
