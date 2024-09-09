provider "aws" {}

resource "aws_instance" "tf-ec2-demo" {
  ami = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  
  tags = {
    Name = "tf-ec2"
  }
}

# Output is displayed on console after execution
output "instance_public_ip" {
  value = "http://${aws_instance.tf-ec2-demo.public_ip}:80/index.html"
}

output "instance_public_dns" {
  value = "http://${aws_instance.tf-ec2-demo.public_dns}:80/index.html"
}
