resource "local_file" "password" {
  filename = "password.txt"
  content = var.password_value
}

variable "password_value" {
  default = "supersecretpassword"
  sensitive = true
}