data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = ["fast-food-vpc"]
  }
}

data "aws_db_subnet_group" "database" {
  name = "fast-food-database-subnet-group"
}