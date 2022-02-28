provider "aws" {
  region = "us-west-1"
}


resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc1"
  }
}
