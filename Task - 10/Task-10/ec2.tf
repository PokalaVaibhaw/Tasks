resource "aws_instance" "public_ec2" {
    ami = "ami-0573b70afecda915d"
    instance_type = "t2.micro"
    security_groups =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.public_subnet.id}"
    user_data= <<-EOF
	#! /bin/bash -ex
	sudo amazon-linux-extras list | grep nginx
	sudo amazon-linux-extras enable nginx1
	sudo yum clean metadata
	sudo yum -y install nginx
	sudo su
	cd usr/share/nginx/html
	sudo chmod 777 index.html
	echo "Welcome to MassMutual" > /usr/share/nginx/html/index.html
	sudo systemctl start nginx 
    EOF
    key_name="vaikk"
    associate_public_ip_address = true
    tags = {
      Name              = "server1"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}



