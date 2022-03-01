variable "region" {
default = "us-west-1"
}
variable "instance_class" {
default = "db.t3.medium"
}
variable "allocated_storage" {
  default     = 32
  type        = number
  description = "Storage allocated to database instance"
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
variable "iops" {
  default     = 0
  type        = number
  description = "The amount of provisioned IOPS"
}

variable "securitygp" {
  type = list
  default = ["sg-0dc87913a3bd53da8"]
}