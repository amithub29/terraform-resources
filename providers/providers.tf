# Official providers don't require source namespace
provider "aws" {
    region = "us-east-1"
}

# Partener providers require source namespace 
terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Access keys or tokens should not be configured inside TF files
provider "github" {
    token = "XXXXXXXXXXXX"
}