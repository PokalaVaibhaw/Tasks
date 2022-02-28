provider "aws" {
    region = "us-west-1"
}


resource "aws_vpc" "terraform-vpc" {
  cidr_block       = "172.16.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "vpc"
  }
}

output "aws_vpc_id" {
  value = "${aws_vpc.terraform-vpc.id}"
}
