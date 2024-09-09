provider "aws" {}

resource "aws_iam_user" "admin" {
  name = "awsadmin"
}

resource "aws_iam_user_policy" "admin-policy" {
  name = "admin-policy"
  user = aws_iam_user.admin.name

# Using jsonencode function to embed permission policy in terraform file
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "*",
            "Resource": "*"
        }
    ]
})
}