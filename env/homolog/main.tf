module "main" {
  source = "../../infra/v1"
  dynamoName = "user"
  rdsPass    = "Mudar123!"
  rdsUser    = "admin"
}

output "rds_endpoint" {
  description = "Endpoint do RDS PostgreSQL"
  value       = module.main.rds_postgres_endpoint
}

output "rds_username" {
  description = "Nome de usuário do RDS PostgreSQL"
  value       = module.main.rds_postgres_username
}

output "rds_password" {
  description = "Senha do RDS PostgreSQL"
  value       = module.main.rds_postgres_password
  sensitive   = true  # Marca como sensível para não exibir em logs
}

output "rds_database_name" {
  description = "Nome do banco de dados inicial"
  value       = module.main.rds_postgres_db_name
}