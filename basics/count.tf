provider "aws" {}

# Count will create 3 EC2 instances
# Count index is used to give different names to instances
resource "aws_instance" "ec2-instances" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  count = 3

  tags = {
    name = "payment-server-${count.index}"
  }
}

variable "user-names" {
  type = list(string)
  description = "names of users"
  default = [ "mike" , "james" , "sarah" , "david" ]
}

# Count index can also be used to access items in the list
resource "aws_iam_user" "developers" {
  name = var.user-names[count.index]
  count = 4
}
