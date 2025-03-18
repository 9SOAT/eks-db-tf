provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key  # Use variáveis ou um gerenciador de segredos
  secret_key = var.aws_secret_key  # Use variáveis ou um gerenciador de segredos
}