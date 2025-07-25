variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
}

variable "dynamodb_read_capacity" {
  description = "Read capacity units for DynamoDB in prod"
  type        = number
  default     = 5
}

variable "dynamodb_write_capacity" {
  description = "Write capacity units for DynamoDB in prod"
  type        = number
  default     = 5
}