terraform {
  backend "s3" {
    bucket         = "fast-food-terraform-state"
    key            = "database/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}