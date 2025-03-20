terraform {
  backend "s3" {
    bucket         = "terraform-state-matheus-fiap"
    key            = "tfstate/terraform.tfstate"
    region         = var.awsRegion
    encrypt        = true
  }
}