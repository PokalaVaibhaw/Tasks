variable "region" {
default = "us-west-1"
}
variable "instance_class" {
default = "db.t3.medium"
}
variable "name" {
default = "vaibhaw"
}
variable "username" {
default = "vaibhaw"
}
variable "password" {
default = "vaibhaw123"
}
variable "securitygp" {
  type = list
  default = ["sg-0dc87913a3bd53da8"]
}