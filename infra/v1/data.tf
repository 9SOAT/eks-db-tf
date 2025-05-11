# -----------------------------------------------------
# AWS Data Sources - Infrastructure References
# -----------------------------------------------------
data "aws_vpc" "fast_food_vpc" {
  filter {
    name = "tag:Name"
    values = ["fast-food-vpc"]
  }
}

data "aws_db_subnet_group" "db_subnet" {
  name = "fast-food-database-subnet-group"
}

data "mongodbatlas_roles_org_id" "org_id" {}

# Security Configuration
resource "random_password" "db_password" {
  length      = 25
  upper       = true
  special     = false
  min_numeric = 5
}