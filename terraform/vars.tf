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
  description = "The password for the RDS instance"
  type        = string  
}
