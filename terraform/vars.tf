variable "rdsUser" {
  description = "The username for the RDS instance"
  type        = string
  default     = ${{ secrets.USERNAME }}
}

variable "rdsPass" {
  description = "The password for the RDS instance"
  type        = string
  default     = "fiap2024!"       
}

variable "projectName" {
  description = "The name of the project"
  default     = "fast_food"
}

variable "dynamoName" {
  description = "The password for the RDS instance"
  type        = string
  default     = "fast-food-consumer"       
}
