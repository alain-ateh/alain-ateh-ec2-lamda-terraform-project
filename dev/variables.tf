variable "ami_id" {
  description = "AMI ID for dev environment"
  type        = string
  default     = "ami-0d1b5a8c13042c939" # Amazon Linux 2 AMI (us-east-1)
}

variable "instance_type" {
  description = "EC2 instance type for dev"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "SSH key pair name for dev"
  type        = string
  default     = "" # Specify your key pair name
}

variable "lambda_timeout" {
  description = "Timeout for Lambda function in dev"
  type        = number
  default     = 10
}

variable "lambda_memory_size" {
  description = "Memory size for Lambda function in dev"
  type        = number
  default     = 128
}
variable "dynamodb_read_capacity" {
  description = "Read capacity units for DynamoDB in dev"
  type        = number
  default     = 1
}