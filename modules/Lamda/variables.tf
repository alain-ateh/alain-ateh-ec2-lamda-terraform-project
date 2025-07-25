variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
}

variable "ec2_instance_id" {
  description = "ID of the EC2 instance to monitor"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket for logs"
  type        = string
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}

variable "lambda_timeout" {
  description = "Timeout for Lambda function in seconds"
  type        = number
}

variable "lambda_memory_size" {
  description = "Memory size for Lambda function in MB"
  type        = number
}
variable "aws_region" {
  description = "AWS region for the Lambda function"
  type        = string
  default     = "us-east-2"
}