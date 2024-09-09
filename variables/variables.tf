# Variable definition can contain default value and other attributes like description and type
variable "static_ip" {
  description = "Jump server's IP"
  default = "10.16.0.0/32"
  type = string
}

variable "ssh_port" {
    default = 22
    type = number
}

variable "http_port" {
    type = number
}
