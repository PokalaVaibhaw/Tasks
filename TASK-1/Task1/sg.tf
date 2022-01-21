
## Security Group##
resource "aws_security_group" "terraform_private_sg" {
  description = "Allow limited inbound external traffic"
  vpc_id      = "${aws_vpc.terraform-vpc.id}"
  name        = "terraform_ec2_private_sg"

  ingress {
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr
    from_port   = 22  
    to_port     = 22 
  }

  egress {
    protocol    = "tcp"
    cidr_blocks = var.sg_cidr
    from_port   = 22
    to_port     = 22
  }

  tags = {
    Name = "ec2-private-sg"
  }
}



output "aws_security_gr_id" {
  value = "aws_security_group.terraform_private_sg.id"
}