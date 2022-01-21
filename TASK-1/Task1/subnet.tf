/* Public subnet */
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.public_subnet_zone
  map_public_ip_on_launch = true
  tags = {
    Name        = "PUBLIC_SUBNET"
  }
}
/* Private subnets */
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = var.private_subnet1_cidr
  availability_zone       = var.private_subnet1_zone
  map_public_ip_on_launch = false
  tags = {
    Name        = "Private_SUBNET1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = var.private_subnet2_cidr
  availability_zone       = var.private_subnet2_zone
  map_public_ip_on_launch = false
  tags = {
    Name        = "Private_SUBNET2"
  }
}
resource "aws_subnet" "private_subnet3" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = var.private_subnet3_cidr
  availability_zone       = var.private_subnet3_zone
  map_public_ip_on_launch = false
  tags = {
    Name        = "Private_SUBNET3"
  }
}
resource "aws_subnet" "private_subnet4" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = var.private_subnet4_cidr
  availability_zone       = var.private_subnet4_zone
  map_public_ip_on_launch = false
  tags = {
    Name        = "Private_SUBNET4"
  }
}
resource "aws_subnet" "private_subnet5" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = var.private_subnet5_cidr
  availability_zone       = var.private_subnet5_zone
  map_public_ip_on_launch = false
  tags = {
    Name        = "Private_SUBNET5"
  }
}