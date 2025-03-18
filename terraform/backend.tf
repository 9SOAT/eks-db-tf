terraform {
  backend "s3" {
    bucket         = "terraform-state-matheus-fiap"
    key            = "tfstate/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
  }
}