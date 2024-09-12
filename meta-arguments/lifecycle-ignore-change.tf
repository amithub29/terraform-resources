provider "aws" {}


resource "aws_instance" "tf-ec2-demo" {
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

# Lifecycle Meta argument prevents Terraform from removing manual changes (Tags in this case)
# Other Meta args - depends_on, count, for_each, provider

  lifecycle {
    ignore_changes = [tags] # 'all' can be used to ignore all attributes' changes 
  }
}
