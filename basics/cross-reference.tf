provider "aws" {}

resource "aws_eip" "elast_ip" {
  domain   = "vpc"
}

resource "aws_security_group" "allow_from_eip" {
  name        = "allow_from_eip"
  description = "Allow SSH inbound traffic from elastic ip"
}

# Cross-referencing other resource and attributes
resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.allow_from_eip.id
  cidr_ipv4         = "${aws_eip.elast_ip.public_ip}/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}
