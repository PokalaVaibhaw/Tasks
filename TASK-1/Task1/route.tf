/* Routing table for public subnet */
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "PUBLIC_ROUTE_TABLE"
  }
}

/* Routing table for private subnets */
resource "aws_route_table" "private1" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "PRIVATE_ROUTE_TABLE1"
  }
}
resource "aws_route_table" "private2" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "PRIVATE_ROUTE_TABLE2"
  }
}

resource "aws_route_table" "private3" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "PRIVATE_ROUTE_TABLE3"
  }
}

resource "aws_route_table" "private4" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "PRIVATE_ROUTE_TABLE4"
  }
}

resource "aws_route_table" "private5" {
  vpc_id = "${aws_vpc.terraform-vpc.id}"
  tags = {
    Name        = "PRIVATE_ROUTE_TABLE5"
  }
}

/* Adding gateway to public subnet in route */
resource "aws_route" "public_internet_gateway" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block =  var.routedest
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

/* Adding gateway to private subnet in route */

resource "aws_route" "private_nat_gateway1" {
  route_table_id         = "${aws_route_table.private1.id}"
  destination_cidr_block = var.routedest
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}
resource "aws_route" "private_nat_gateway2" {
  route_table_id         = "${aws_route_table.private2.id}"
  destination_cidr_block = var.routedest
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}
resource "aws_route" "private_nat_gateway3" {
  route_table_id         = "${aws_route_table.private3.id}"
  destination_cidr_block = var.routedest
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}
resource "aws_route" "private_nat_gateway4" {
  route_table_id         = "${aws_route_table.private4.id}"
  destination_cidr_block = var.routedest
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}
resource "aws_route" "private_nat_gateway5" {
  route_table_id         = "${aws_route_table.private5.id}"
  destination_cidr_block = var.routedest
  nat_gateway_id         = "${aws_nat_gateway.nat.id}"
}

/* Route table associations for public subnets */
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public.id}"
}
/* Route table associations for private subnets */
resource "aws_route_table_association" "private1" {
  subnet_id      = "${aws_subnet.private_subnet1.id}"
  route_table_id = "${aws_route_table.private1.id}"
}
resource "aws_route_table_association" "private2" {
  subnet_id      = "${aws_subnet.private_subnet2.id}"
  route_table_id = "${aws_route_table.private2.id}"
}
resource "aws_route_table_association" "private3" {
  subnet_id      = "${aws_subnet.private_subnet3.id}"
  route_table_id = "${aws_route_table.private3.id}"
}
resource "aws_route_table_association" "private4" {
  subnet_id      = "${aws_subnet.private_subnet4.id}"
  route_table_id = "${aws_route_table.private4.id}"
}
resource "aws_route_table_association" "private5" {
  subnet_id      = "${aws_subnet.private_subnet5.id}"
  route_table_id = "${aws_route_table.private5.id}"
}
