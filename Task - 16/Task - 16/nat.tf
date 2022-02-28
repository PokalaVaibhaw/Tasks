resource "aws_eip" "nat_eip" {
  vpc        = true
}


resource "aws_nat_gateway" "nat1" {
  allocation_id = "${aws_eip.nat_eip.id}"
   subnet_id     = "${aws_subnet.public_subnet.id}"
  depends_on    = [aws_internet_gateway.ig]
  tags = {
    Name        = "nat1"
 
  }
}
