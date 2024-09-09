variable "static_ip" {
  description = "Jump server's IP"
  default = "10.16.0.0/32"
}

variable "ssh_port" {
    default = 22
}

variable "http_port" {}
