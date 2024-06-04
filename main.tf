provider "aws" {
  region                 = "us-east-1"
}

terraform {
  backend "s3" {
    bucket  = "sunny-test-bucket-fsgef"
    key     = "terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

# Create a VPC
resource "aws_vpc" "main_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sunnyTestVpc"
  }
}

# Outputs
output "vpc_id" {
  value = aws_vpc.main_vpc.id
}