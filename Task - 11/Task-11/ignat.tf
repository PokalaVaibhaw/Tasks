/* Internet gateway for the VPC */
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "ig"
  }
}



resource "aws_eip" "nat_eip" {
  vpc        = true
}

/* NAT */
resource "aws_nat_gateway" "nat1" {
  allocation_id = "${aws_eip.nat_eip.id}"
   subnet_id     = "${aws_subnet.public_subnet.id}"
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = "natgw"
 
  }
}