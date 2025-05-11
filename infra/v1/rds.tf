resource "aws_security_group" "rds_security_group_fast_food" {
  vpc_id = data.aws_vpc.fast_food_vpc.id
  name = "fast-food-rds-security-group"
}

resource "aws_vpc_security_group_egress_rule" "rds_allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.rds_security_group_fast_food.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "rds_allow_http_ipv4" {
  security_group_id = aws_security_group.rds_security_group_fast_food.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 5432
  ip_protocol       = "tcp"
  to_port           = 5432
}

resource "aws_db_instance" "rds_postgres_fast_food" {
  identifier              = "postgres-cluster"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "16.5"
  instance_class          = "db.t3.micro"
  storage_type            = "gp2"
  db_name                 = var.projectName
  username                = var.rdsUser
  password                = var.rdsPass
  publicly_accessible     = true
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_security_group_fast_food.id]
  db_subnet_group_name    = data.aws_db_subnet_group.db_subnet.name
  backup_retention_period = 5
}
