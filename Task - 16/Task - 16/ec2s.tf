
resource "aws_instance" "public_ec2" {
    ami = "ami-0573b70afecda915d"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_public_sg.id}" ]
    subnet_id = "${aws_subnet.public_subnet.id}"

    key_name               = "vaikey1"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "linuxpublicserver"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}



resource "aws_instance" "private_ec2" {
    ami = "ami-0dfc3da39bb6f571c"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.private_subnet1.id}"
    key_name               = "vaikey1"
    associate_public_ip_address = false
    tags = {
      Name              = "windowsprivateserver"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}