provider "aws" {}

resource "aws_iam_user" "admin" {
  name = "awsadmin"
}

resource "aws_iam_user_policy" "admin-policy" {
  name = "admin-policy"
  user = aws_iam_user.admin.name

# Using file function to import content of another file
  policy = file("./policy.json")
}
