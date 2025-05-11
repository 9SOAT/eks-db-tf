locals {
  # Extract MongoDB connection components for better readability
  mongodb_user     = mongodbatlas_database_user.mongodbatlas_database_user.username
  mongodb_password = mongodbatlas_database_user.mongodbatlas_database_user.password
  mongodb_host = trimprefix(mongodbatlas_cluster.mongodbatlas_cluster.connection_strings[0].standard_srv, "mongodb+srv://")
  mongodb_auth_db = mongodbatlas_database_user.mongodbatlas_database_user.auth_database_name

  # Construct the MongoDB connection URL
  mongodb_url = "mongodb+srv://${local.mongodb_user}:${local.mongodb_password}@${local.mongodb_host}/${var.projectName}?authSource=${local.mongodb_auth_db}"

  # Build the secret content as a JSON object
  mongodb_secret = jsonencode({
    MONGO_URL = local.mongodb_url
  })
}

resource "aws_secretsmanager_secret" "mongo" {
  name                    = "/${var.projectName}-catalog/mongo"
  recovery_window_in_days = 0
}

resource "aws_secretsmanager_secret_version" "mongo" {
  secret_id     = aws_secretsmanager_secret.mongo.id
  secret_string = local.mongodb_secret
}