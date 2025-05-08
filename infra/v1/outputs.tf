output "rds_postgres_endpoint" {
  description = "Endpoint do RDS PostgreSQL"
  value       = aws_db_instance.rds_postgres_fast_food.endpoint
}

output "rds_postgres_username" {
  description = "Nome de usuário do RDS PostgreSQL"
  value       = aws_db_instance.rds_postgres_fast_food.username
}

output "rds_postgres_password" {
  description = "Senha do RDS PostgreSQL"
  value       = aws_db_instance.rds_postgres_fast_food.password
  sensitive   = true  # Marca como sensível para não exibir em logs
}

output "rds_postgres_db_name" {
  description = "Nome do banco de dados inicial"
  value       = aws_db_instance.rds_postgres_fast_food.db_name
}