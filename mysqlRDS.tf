resource "aws_db_instance" "terraformRDS" {
  allocated_storage    = 10
  max_allocated_storage = 20
  db_name              = "terraformRDS"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "jack"
  ### password             = "thisshouldntbehere"
  manage_master_user_password = true
  parameter_group_name = "terraformrds"
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "terraformrds" {
name = "terraformrds"
family = "mysql8.0"

parameter {
name = "character_set_server"
value = "utf8mb4"
apply_method = "immediate"
}

parameter {
name = "max_connections"
value = "200"
apply_method = "pending-reboot"
}
}