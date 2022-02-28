## Security Group##
resource "aws_security_group" "terraform_private_sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  name        = "sg"

 ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
  }

 ingress {
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    to_port     = 80
  }


  egress {
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 0
    to_port     = 0
  }

  tags = {
    Name = "sg"
  }
}

output "aws_security_gr_id" {
  value = "${aws_security_group.terraform_private_sg.id}"
}
