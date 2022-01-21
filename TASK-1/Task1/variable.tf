
variable "region" {
default = "us-east-1"
}
variable "instance_type" {
default = "t2.micro"
}
variable "vpc_cidr" {
default = "198.162.0.0/16"
}
variable "public_subnet_cidr" {
default = "198.162.1.0/24"
}
variable "private_subnet1_cidr" {
default = "198.162.2.0/24"
}
variable "private_subnet2_cidr" {
default = "198.162.3.0/24"
}
variable "private_subnet3_cidr" {
default = "198.162.4.0/24"
}
variable "private_subnet4_cidr" {
default = "198.162.5.0/24"
}
variable "private_subnet5_cidr" {
default = "198.162.6.0/24"
}
variable "public_subnet_zone" {
default = "us-east-1a"
}
variable "private_subnet1_zone" {
default = "us-east-1b"
}
variable "private_subnet2_zone" {
default = "us-east-1c"
}
variable "private_subnet3_zone" {
default = "us-east-1d"
}
variable "private_subnet4_zone" {
default = "us-east-1e"
}
variable "private_subnet5_zone" {
default = "us-east-1f"
}
variable "sg_cidr" {
default = ["49.37.153.103/32"]
}
variable "routedest" {
default = "0.0.0.0/0"
}
variable "ec2ami"{
default = "ami-08e4e35cccc6189f4"
}
variable "keyname"{
default = "vaibhawkey"
}
