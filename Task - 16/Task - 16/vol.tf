resource "aws_ebs_volume" "data-vol-1" {
 availability_zone = "us-west-1c"
 size = 50
 tags = {
        Name = "d-vol"
 }

}

resource "aws_volume_attachment" "vol-1" {
 device_name = "/dev/xvdb"
 volume_id = "${aws_ebs_volume.data-vol-1.id}"
 instance_id = "${aws_instance.private_ec2.id}"
}


resource "aws_ebs_volume" "data-vol-2" {
 availability_zone = "us-west-1c"
 size = 50
 tags = {
        Name = "e-vol"
 }

}

resource "aws_volume_attachment" "vol-2" {
 device_name = "/dev/xvdc"
 volume_id = "${aws_ebs_volume.data-vol-2.id}"
 instance_id = "${aws_instance.private_ec2.id}"
}