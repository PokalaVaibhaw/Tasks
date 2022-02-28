resource "aws_subnet" "public_subnet" {
  vpc_id                  = "${aws_vpc.terraform-vpc.id}"
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "us-west-1b"
  map_public_ip_on_launch = true
  tags = {
    Name        = "pubsub"
  }
}