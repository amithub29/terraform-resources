provider "aws" {}

variable "user-names" {
  type        = list(string)
  description = "names of users"
  default     = ["mike", "james", "sarah", "david"]
}

resource "aws_iam_user" "admin" {
  count = length(var.user-names)
  name  = "admin-${var.user-names[count.index]}"
}

output "admin-users" {
  value = aws_iam_user.admin[*].name
}
