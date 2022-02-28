resource "aws_instance" "public_ec2" {
    ami = "ami-0573b70afecda915d"
    instance_type = "t2.micro"
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.public_subnet.id}"

    key_name               = "vaikey1"
    count         = 1
    associate_public_ip_address = true
    tags = {
      Name              = "publicserver"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}



resource "aws_instance" "private_ec2" {
    ami = "ami-0573b70afecda915d"
    instance_type = "t2.micro"
  vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.private_subnet1.id}"
root_block_device {
    volume_size           = "200"
}
  user_data= <<-EOF
#!/bin/bash

yum update -y

amazon-linux-extras enable postgresql11

yum install postgresql-server postgresql-devel -y
/usr/bin/postgresql-setup --initdb

sed -i "59i listen_addresses = '*'" /var/lib/pgsql/data/postgresql.conf

systemctl enable postgresql
systemctl start postgresql

EOF
    key_name               = "vaikey1"
    count         = 1
    associate_public_ip_address = false
    tags = {
      Name              = "privateserver"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}

