variable "rdsUser" {
  description = "The username for the RDS instance"
  type        = string
  default = "postgres"
}

variable "rdsPass" {
  description = "The password for the RDS instance"
  type        = string
  default = "Mudar123!"
}

variable "projectName" {
  description = "The name of the project"
  default     = "fast_food"
}

variable "dynamoName" {
  description = "The name of the DynamoDB table"
  type        = string
  default     = "consumer"
}

variable "awsRegion" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}