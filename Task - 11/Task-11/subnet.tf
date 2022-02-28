/* Public subnet */
resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.1.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true
  tags = {
    Name        = "pub_subnet"
  }
}


/* Private subnet */
resource "aws_subnet" "private_subnet1" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "172.16.2.0/24"
  availability_zone       = "us-west-1c"
  map_public_ip_on_launch = false
  tags = {
    Name        = "private_sub"
  }
}
