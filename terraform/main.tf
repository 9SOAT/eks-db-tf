resource "aws_vpc" "labFIAP" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name        = "labFIAPVPC"
    Environment = "Dev"
    Owner = "Matheus"
  }
}

resource "aws_subnet" "publiclabFIAP" {
  vpc_id                  = aws_vpc.labFIAP.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = var.awsRegion

  tags = {
    Name        = "PublicSubnet"
    Environment = "Dev"
    Owner = "Matheus"
  }
}

resource "aws_subnet" "privatelabFIAP" {
  vpc_id            = aws_vpc.labFIAP.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.awsRegion

  tags = {
    Name        = "PrivateSubnet"
    Environment = "Dev"
    Owner = "Matheus"
  }
}

resource "aws_security_group" "rds_sglabFIAP" {
  vpc_id = aws_vpc.labFIAP.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "RDS-SG"
    Environment = "Dev"
    Owner = "Matheus"
  }
}

resource "aws_db_subnet_group" "rds_subnet_grouplabFIAP" {
  name       = "rds-subnet-group"
  subnet_ids = [aws_subnet.privatelabFIAP.id, aws_subnet.publiclabFIAP.id]

  tags = {
    Name        = "RDS-Subnet-Group"
    Environment = "Dev"
    Owner = "Matheus"
  }
}

resource "aws_db_instance" "postgreslabFIAP" {
  identifier              = "postgres-cluster"
  allocated_storage       = 20
  engine                  = "postgres"
  engine_version          = "16.5"
  instance_class          = "db.t3.micro"
  storage_type            = "gp2"
  db_name                 = var.projectName 
  username                = var.rdsUser
  password                = var.rdsPass
  publicly_accessible     = false
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds_sglabFIAP.id]
  db_subnet_group_name    = aws_db_subnet_group.rds_subnet_grouplabFIAP.name

  tags = {
    Name        = "PostgresDB"
    Environment = "Dev"
    Owner = "Matheus"
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