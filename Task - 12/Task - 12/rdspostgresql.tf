
provider "aws" {
  region = "var.region"
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "postgres"
  identifier           =  "database-db"     
  engine_version       = "13"
  instance_class       =  var.instance_class
  name                 =  var.name
  username             =  var.username
  password             =  var.password
  vpc_security_group_ids = var.securitygp
  skip_final_snapshot  = true
  publicly_accessible  = true

}