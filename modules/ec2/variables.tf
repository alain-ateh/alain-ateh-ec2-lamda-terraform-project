variable "environment" {
  description = "Deployment environment (dev or prod)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "prod_cidr_block" {
  description = "CIDR block for prod environment SSH access"
  type        = string
  default     = "0.0.0.0/0"
}