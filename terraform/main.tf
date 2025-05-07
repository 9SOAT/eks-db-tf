resource "aws_security_group" "rds_security_group_fast_food" {
  vpc_id = data.aws_vpc.vpc.id
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
  db_subnet_group_name    = data.aws_db_subnet_group.database.name
}

resource "null_resource" "create_additional_databases" {
  depends_on = [aws_db_instance.rds_postgres_fast_food]

  provisioner "local-exec" {
    command = <<EOT
      PGPASSWORD=${var.rdsPass} psql -h ${aws_db_instance.rds_postgres_fast_food.address} -U ${var.rdsUser} -d ${var.projectName} -c "CREATE DATABASE clientes;"
      PGPASSWORD=${var.rdsPass} psql -h ${aws_db_instance.rds_postgres_fast_food.address} -U ${var.rdsUser} -d ${var.projectName} -c "CREATE DATABASE pedidos;"
    EOT
  }
}

resource "aws_dynamodb_table" "users" {
  name           = var.dynamoName
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "cpf"

  attribute {
    name = "cpf"
    type = "S"
  }

  tags = {
  Name        = "DinamoDB"
  Environment = "Dev"
  Owner = "Matheus"
  }
}
