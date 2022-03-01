provider "aws" {
  region = var.region
}
resource "aws_db_instance" "postgresdb" {
  allocated_storage    =  var.allocated_storage
  engine               = "postgres"
  identifier           =  "db-1"     
  engine_version       = "13"
  instance_class       =  var.instance_class
  iops                 = var.iops
  name                 =  var.name
  username             =  var.username
  password             =  var.password
  vpc_security_group_ids = var.securitygp
  skip_final_snapshot  = true
  publicly_accessible  = true

}