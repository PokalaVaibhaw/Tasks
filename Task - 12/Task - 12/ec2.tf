resource "aws_instance" "ec2" {
    ami = "ami-082ccf4cbcda7b2b4"
    instance_type = "t2.micro"
    security_groups =  var.securitygp
    subnet_id = "subnet-0d9e9cff6218618a9"
    key_name="vaikey1"
    associate_public_ip_address = true
    tags = {
      Name              = "server1"
      Environment       = "development"
      Project           = "TERRAFORM"
    }
}



