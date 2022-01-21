
resource "aws_instance" "public_ec2" {
    ami = var.ec2ami
    instance_type = var.instance_type
    vpc_security_group_ids =  [ "${aws_security_group.terraform_private_sg.id}" ]
    subnet_id = "${aws_subnet.public_subnet.id}"
    key_name               = var.keyname
  
    associate_public_ip_address = true
    tags = {
      Name              = "Server1"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}

output "aws_instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.public_ec2.id
}

