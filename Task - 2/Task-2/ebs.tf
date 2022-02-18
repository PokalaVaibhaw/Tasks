provider "aws"{
region = "us-west-1"
}

resource "aws_ebs_volume" "volume" {
availability_zone = aws_instance.inst.availability_zone
size              = 200
tags = {
    Name = "vol"
  }
}
resource "aws_volume_attachment" "ebs" {
device_name = "/dev/sdh"
volume_id   = aws_ebs_volume.volume.id
instance_id = aws_instance.inst.id
}


resource "aws_instance" "inst" {
ami= "ami-0573b70afecda915d"
instance_type = "t2.micro"
vpc_security_group_ids =  [ "sg-0c5a4d85e0b948932" ]
root_block_device {
    volume_size           = 100
  }
key_name = "vaikk"
user_data = <<-EOF
#!/bin/bash
yum update -y
sudo file -s /dev/xvdh
sudo mkfs -t xfs /dev/xvdh
sudo mkdir /var/u01
sudo mount /dev/xvdh /var/u01
EOF

tags = {
Name = "server1"
}

}



