resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "ig1"
  }
}