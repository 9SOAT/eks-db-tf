data "aws_vpc" "vpc" {
  filter {
    name = "tag:Team"
    values = ["fast_food"]
  }
}

data "aws_db_subnet_group" "database" {
  name = "fast-food-database-subnet-group"
  filter {
    name = "tag:Name"
    values = ["fast-food-database-subnet-group"]
  }
}