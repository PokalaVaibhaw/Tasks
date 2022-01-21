provider "aws" {
  region  = var.region
}

resource "aws_vpc" "terraform-vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "server-vpc"
  }
}

output "aws_vpc_id" {
  value = "aws_vpc.terraform-vpc.id"
}


/* Internet gateway */
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "INTERNET_GATEWAY"
  }
}
