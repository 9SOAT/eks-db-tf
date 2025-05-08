resource "aws_dynamodb_table" "consumer" {
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
    Owner       = "Matheus"
  }
}
