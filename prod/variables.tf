variable "ami_id" {
  description = "AMI ID for prod environment"
  type        = string
  default     = "ami-0d1b5a8c13042c939" # Amazon Linux 2 AMI (us-east-1)
}

variable "instance_type" {
  description = "EC2 instance type for prod"
  type        = string
  default     = "t2.medium"
}

variable "key_name" {
  description = "SSH key pair name for prod"
  type        = string
  default     = "" # Specify your key pair name
}

variable "prod_cidr_block" {
  description = "CIDR block for SSH access in prod"
  type        = string
  default     = "0.0.0.0/0" # Replace with your IP
}

variable "lambda_timeout" {
  description = "Timeout for Lambda function in prod"
  type        = number
  default     = 30
}

variable "lambda_memory_size" {
  description = "Memory size for Lambda function in prod"
  type        = number
  default     = 256
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
variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}
variable "aws_region" {
  description = "AWS region for prod environment"
  type        = string
  default     = "us-east-2"
}