module "ec2" {
  source        = "../../modules/ec2"
  region        = "us-east-1"
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"
  tag-name      = "ec2-instance-1"
}

resource "aws_eip" "elastic-ip" {
  instance = module.ec2.instance-id
  domain   = "vpc"
}
