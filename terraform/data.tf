data "aws_vpc" "vpc" {
  filter {
    name = "tag:Team"
    values = ["fast_food"]
  }
}

data "aws_db_subnet_groups" "database" {
  name = "fast-food-database-subnet-group"
}