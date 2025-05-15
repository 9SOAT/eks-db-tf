variable "rdsUser" {
  description = "The username for the RDS instance"
  type        = string
}

variable "rdsPass" {
  description = "The password for the RDS instance"
  type        = string
}

variable "projectName" {
  description = "The name of the project"
  default     = "fast_food"
}

variable "dynamoName" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "awsRegion" {
  description = "AWS region to deploy the infrastructure"
  type        = string
  default     = "us-east-1"
}